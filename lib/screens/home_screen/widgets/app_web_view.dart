import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/models/node.dart';
import 'package:story_saver_video_downloader/providers/initial_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/nodes_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:story_saver_video_downloader/providers/web_view_controller_provider.dart';
import 'package:story_saver_video_downloader/providers/xhr_stream_provider.dart';
import 'package:story_saver_video_downloader/utils/scripts.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class AppWebView extends ConsumerWidget {
  const AppWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey webViewKey = GlobalKey();

    return InAppWebView(
      key: webViewKey,
      initialUrlRequest:
          URLRequest(url: WebUri("https://www.instagram.com/roger.ims")),
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
      ),
      onScrollChanged: (controller, x, y) async {
        await controller
            .evaluateJavascript(source: onScrollChangedScript)
            .then((newScrollY) {
          ref.read(scrollYProvider.notifier).state = (newScrollY is double)
              ? newScrollY
              : (newScrollY is int)
                  ? newScrollY.toDouble()
                  : 0.0;
        });
      },
      onUpdateVisitedHistory: (controller, url, isReload) async {
        // Wait until the page is fully loaded
        await Future.delayed(const Duration(seconds: 2));

        // Set the coordinate where are the posts
        await controller
            .evaluateJavascript(source: onUpdateVisitedHistoryInitialYPosScript)
            .then((value) {
          ref.read(initialYPositionProvider.notifier).state = (value is double)
              ? value
              : (value is int)
                  ? value.toDouble()
                  : 0.0;
        });
      },
      onWebViewCreated: (controller) {
        ref.read(webViewControllerProvider.notifier).state = controller;

        final webViewController = ref.read(webViewControllerProvider);

        webViewController?.addJavaScriptHandler(
          handlerName: 'interceptedXHR',
          callback: (args) {
            final String data = args[0];
            ref.read(xhrStreamProvider).add(data);
          },
        );

        webViewController?.addJavaScriptHandler(
          handlerName: 'interceptedGraphQl',
          callback: (args) {
            final elements = args[0];

            String jsonString = elements.join("").replaceAll("\u0026", "&");

            final jsonObject = jsonDecode(jsonString) as Map<String, dynamic>;

            final List edges = jsonObject["data"]
                    ["xdt_api__v1__feed__user_timeline_graphql_connection"]
                ["edges"] as List;
            List<Node> nodes =
                edges.map((e) => Node.fromJson(e['node'])).toList();

            final oldNodes = ref.read(nodesProvider);

            if (oldNodes.isEmpty) {
              // If oldNodes is empty, just set the new nodes.
              ref.read(nodesProvider.notifier).state = nodes;
            } else {
              // Check if any of the new nodes already exist in the oldNodes based on 'code'.
              final alreadyExists = oldNodes.any((oldNode) =>
                  nodes.any((newNode) => newNode.code == oldNode.code));

              if (!alreadyExists) {
                ref.read(nodesProvider.notifier).state = [
                  ...nodes,
                  ...oldNodes
                ];
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
      },
      onLoadStop: (controller, url) async {
        await controller.evaluateJavascript(source: """
                                  (function() {                                      
                                      var originalFetch = window.fetch;
                                      window.fetch = function() {
                                          var requestUrl = arguments[0];
                                          var responsePromise = originalFetch.apply(this, arguments);
              
                                          responsePromise.then(function(response) {
                                              if (requestUrl.includes('https://instagram.fzrh5-1.fna.fbcdn.net/')) {
                                                  window.flutter_inappwebview.callHandler('interceptedXHR', requestUrl);
                                                  //console.log('Intercepted request:', requestUrl);
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
      },
    );
  }
}
