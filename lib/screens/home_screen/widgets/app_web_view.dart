import 'package:story_saver_video_downloader/models/navigation_state.dart';
import 'package:story_saver_video_downloader/providers/navigation_state_provider.dart';
import 'package:story_saver_video_downloader/providers/web_view_controller_provider.dart';
import 'package:story_saver_video_downloader/providers/initial_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/xhr_stream_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:story_saver_video_downloader/providers/history_provider.dart';
import 'package:story_saver_video_downloader/providers/nodes_provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:story_saver_video_downloader/utils/utils.dart';
import 'package:story_saver_video_downloader/models/node.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class AppWebView extends ConsumerStatefulWidget {
  const AppWebView({super.key});

  @override
  ConsumerState<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends ConsumerState<AppWebView> {
  late GlobalKey webViewKey;

  @override
  void initState() {
    super.initState();
    webViewKey = GlobalKey();
  }

  @override
  void dispose() {
    webViewKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const initialUrl = "https://www.instagram.com/";

    return InAppWebView(
      key: webViewKey,
      initialUrlRequest: URLRequest(url: WebUri(initialUrl)),
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
      ),
      onScrollChanged: onScrollChanged,
      onUpdateVisitedHistory: onUpdateVisitedHistory,
      onWebViewCreated: onWebViewCreated,
      onLoadStop: onLoadStop,
      onLoadResource: (controller, resource) {
        if (resource.url.toString().contains(".mp4")) {
          ref.read(xhrStreamProvider).add(resource.url.toString());
        }
      },
    );
  }

  void onScrollChanged(InAppWebViewController controller, int x, int y) async {
    await controller.evaluateJavascript(source: """
  (function() {
      return window.scrollY;
  })()
""").then((newScrollY) {
      ref.read(scrollYProvider.notifier).state = (newScrollY is double)
          ? newScrollY
          : (newScrollY is int)
              ? newScrollY.toDouble()
              : 0.0;
    });
  }

  void onUpdateVisitedHistory(
      InAppWebViewController controller, WebUri? url, bool? isReload) async {
    // Update the history url
    String historyUrl = url.toString();
    ref.read(historyProvider.notifier).state = historyUrl;

    // Update navigation state
    updateNavigationState(ref, historyUrl);

    final navigationState = ref.read(navigationStateProvider);

    if (navigationState == NavigationState.profile) {
      // Wait until the page is fully loaded
      await Future.delayed(const Duration(seconds: 3));

      // Set the coordinate where are the posts
      await controller.evaluateJavascript(source: """
      (function() {
          const element = document.querySelector("main > div > div:nth-child(4)");
          if (element) {
              const yPos = element.getBoundingClientRect().top + window.scrollY;
              return yPos
          }
      })()
      """).then((value) {
        ref.read(initialYPositionProvider.notifier).state = (value is double)
            ? value
            : (value is int)
                ? value.toDouble()
                : 0.0;
      });
    }
  }

  void onWebViewCreated(InAppWebViewController controller) {
    ref.read(webViewControllerProvider.notifier).state = controller;

    final webViewController = ref.read(webViewControllerProvider);

    webViewController?.addJavaScriptHandler(
      handlerName: 'interceptedXHR',
      callback: (args) {
        // final String data = args[0];
        // ref.read(xhrStreamProvider).add(data);
      },
    );

    webViewController?.addJavaScriptHandler(
      handlerName: 'interceptedGraphQl',
      callback: (args) {
        final elements = args[0];

        String jsonString = elements.join("").replaceAll("\u0026", "&");

        final jsonObject = jsonDecode(jsonString) as Map<String, dynamic>;

        final List edges = jsonObject["data"]
                ["xdt_api__v1__feed__user_timeline_graphql_connection"]["edges"]
            as List;
        List<Node> nodes = edges.map((e) => Node.fromJson(e['node'])).toList();

        final oldNodes = ref.read(nodesProvider);

        if (oldNodes.isEmpty) {
          // If oldNodes is empty, just set the new nodes.
          ref.read(nodesProvider.notifier).state = nodes;
        } else {
          // Check if any of the new nodes already exist in the oldNodes based on 'code'.
          final alreadyExists = oldNodes.any((oldNode) =>
              nodes.any((newNode) => newNode.code == oldNode.code));

          if (!alreadyExists) {
            ref.read(nodesProvider.notifier).state = [...nodes, ...oldNodes];
          }
        }

        return null;
      },
    );

    webViewController?.setSettings(
        settings: InAppWebViewSettings(
            javaScriptEnabled: true,
            useShouldInterceptRequest: true,
            userAgent:
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"));
  }

  void onLoadStop(InAppWebViewController controller, WebUri? url) async {
    await controller.evaluateJavascript(source: """
      (function() {                                      
          var originalFetch = window.fetch;
          window.fetch = function() {
              var requestUrl = arguments[0];
              var responsePromise = originalFetch.apply(this, arguments);

              responsePromise.then(function(response) {
                  if (requestUrl.includes('instagram.fbcn7-2.fna.fbcdn.net')) {
                      window.flutter_inappwebview.callHandler('interceptedXHR', requestUrl);
                      console.log('Intercepted Fetch URL with bytestart and byteend:', requestUrl);
                      
                      response.clone().text().then(function(body) {
                        //console.log('Fetch Response Body:', body);
                      });
                  }
                  return response;
              }).catch(function(error) {
                  console.error('Fetch Error:', error);
              });
              return responsePromise;
          };
          
          var originalXHROpen = XMLHttpRequest.prototype.open;
          XMLHttpRequest.prototype.open = function() {
              var xhr = this;
              this.addEventListener('load', function() {
                  if (xhr.responseURL.includes('instagram.fbcn7-2.fna.fbcdn.net')) {
                      //console.log('Intercepted XHR URL with bytestart and byteend:', xhr.responseURL);
                      console.log('XHR Response Body:', xhr.responseText);
                  }


                  var currentUrl = window.location.href;

                  if (currentUrl === 'https://www.instagram.com/') {
                    // Don't save nodes from the home page
                    return false;
                  }

                  if (xhr.responseURL.includes('https://www.instagram.com/graphql/query')) {
                    var responseJson = JSON.parse(xhr.responseText);

                    if (!responseJson.data.hasOwnProperty('xdt_api__v1__feed__user_timeline_graphql_connection')) {
                      return false;
                    }

                    // Convert to string if necessary and chunk it
                    var responseString = JSON.stringify(responseJson);
                    var chunkSize = 10000; // Size of each chunk
                    var totalChunks = Math.ceil(responseString.length / chunkSize);
                    var chunks = [];
                    
                    for (var i = 0; i < totalChunks; i++) {
                      var chunk = responseString.slice(i * chunkSize, (i + 1) * chunkSize);
                      chunks.push(chunk)
                      // console.log('Intercepted Graphql Query:', responseJson);
                    }
                    window.flutter_inappwebview.callHandler('interceptedGraphQl', chunks);
                  }
              });
              originalXHROpen.apply(this, arguments);
          };
      })();
      """);
  }
}
