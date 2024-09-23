import 'package:story_saver_video_downloader/models/carousel.dart';
import 'package:story_saver_video_downloader/models/edge.dart';
import 'package:story_saver_video_downloader/models/navigation_state.dart';
import 'package:story_saver_video_downloader/models/stories.dart';
import 'package:story_saver_video_downloader/providers/highlighted_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/is_story_active_provider.dart';
import 'package:story_saver_video_downloader/providers/navigation_state_provider.dart';
import 'package:story_saver_video_downloader/providers/stories_provider.dart';
import 'package:story_saver_video_downloader/providers/story_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/username_provider.dart';
import 'package:story_saver_video_downloader/providers/web_view_controller_provider.dart';
import 'package:story_saver_video_downloader/providers/initial_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/xhr_stream_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:story_saver_video_downloader/providers/history_provider.dart';
import 'package:story_saver_video_downloader/providers/edges_provider.dart';
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
      onUpdateVisitedHistory: onUpdateVisitedHistory,
      onWebViewCreated: onWebViewCreated,
      onScrollChanged: onScrollChanged,
      onLoadResource: onLoadResource,
      onLoadStop: onLoadStop,
    );
  }

  void onLoadResource(
      InAppWebViewController controller, LoadedResource resource) {
    if (resource.url.toString().contains(".mp4")) {
      ref.read(xhrStreamProvider).add(resource.url.toString());
    }
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
    final stories = ref.read(storiesProvider);
    final username = ref.read(usernameProvider);

    if (navigationState == NavigationState.profile &&
        ref.read(isStoryActiveProvider) &&
        !stories.any((e) => e.username == username)) {
      await controller.loadUrl(
          urlRequest: URLRequest(
              url: WebUri(
                  "https://www.instagram.com/stories/${ref.read(usernameProvider)}")));
      await controller.goBack();
    }

    if (navigationState == NavigationState.profile) {
      await controller.evaluateJavascript(source: """
        // Immediately call the function and return the result
        function waitForElement(selector, timeout) {
            return new Promise((resolve, reject) => {
                const startTime = Date.now();
                const interval = setInterval(() => {
                    const element = document.querySelector(selector);
                    if (element) {
                        const yPos = element.getBoundingClientRect().top + window.scrollY;
                        clearInterval(interval);
                        resolve(yPos + 1); // Return the position
                    }

                    if (Date.now() - startTime > timeout) {
                        clearInterval(interval);
                        reject("Element not found within timeout");
                    }
                }, 100);
            });
        }

        (async function() {
            const result = await waitForElement("main > div > hr:nth-child(3)", 10000); // 10 seconds timeout
            window.flutter_inappwebview.callHandler('initialYPosition', result);


            var isMyProfile = false;
            const element = document.querySelector("main > div > header:nth-child(1) > section:nth-child(1) > div > div > div > div");
            if(element){
              isMyProfile = true
            }

            const storyElement = await waitForElement("main > div > header:nth-child(1) > section:nth-child(1) > div", 10000);
            window.flutter_inappwebview.callHandler('storyYPosition', isMyProfile ? storyElement + 100 : storyElement);

            var isActiveStory = false;
            const activeStory = document.querySelector("main > div > header:nth-child(1) > section:nth-child(1) > div > div > canvas");
            if(activeStory){
              isActiveStory = true
            }
            window.flutter_inappwebview.callHandler('isActiveStory', isActiveStory);

            const highlighted = await waitForElement("main > div > header:nth-child(1) > section:nth-child(6) > div > div > div > div > div > ul > li:nth-child(2) > div > div > div > div:nth-child(1)")
            window.flutter_inappwebview.callHandler('highlightedYPosition', highlighted);
        })();
      """);
    }
  }

  void onWebViewCreated(InAppWebViewController controller) {
    ref.read(webViewControllerProvider.notifier).state = controller;

    final webViewController = ref.read(webViewControllerProvider);

    webViewController?.addJavaScriptHandler(
        handlerName: "initialYPosition",
        callback: (args) {
          final value = args[0];

          ref.read(initialYPositionProvider.notifier).state = value is double
              ? value
              : (value is int)
                  ? value.toDouble()
                  : 0.0;
        });

    webViewController?.addJavaScriptHandler(
        handlerName: "storyYPosition",
        callback: (args) {
          final value = args[0];

          ref.read(storyYPositionProvider.notifier).state = value is double
              ? value
              : (value is int)
                  ? value.toDouble()
                  : 0.0;
        });

    webViewController?.addJavaScriptHandler(
        handlerName: "highlightedYPosition",
        callback: (args) {
          final value = args[0];

          ref.read(highlightedYPositionProvider.notifier).state =
              value is double
                  ? value
                  : (value is int)
                      ? value.toDouble()
                      : 0.0;
        });
    webViewController?.addJavaScriptHandler(
        handlerName: "isActiveStory",
        callback: (args) {
          final value = args[0];
          if (value is bool) {
            ref.read(isStoryActiveProvider.notifier).state = value;
          }
        });

    webViewController?.addJavaScriptHandler(
      handlerName: 'interceptedGraphQl',
      callback: (args) {
        final elements = args[0];

        String jsonString = elements.join("").replaceAll("\u0026", "&");

        final jsonObject = jsonDecode(jsonString) as Map<String, dynamic>;

        final edges = jsonObject["data"]
                ["xdt_api__v1__feed__user_timeline_graphql_connection"]["edges"]
            as List?;

        final nodes = edges?.map((e) => Node.fromJson(e['node'])).toList();

        final items = jsonObject["data"]["xdt_api__v1__feed__reels_media"]
            ["reels_media"]["items"] as List?;
        final carouselMedia =
            items?.map((e) => CarouselMedia.fromJson(e)).toList();
        if (carouselMedia != null && carouselMedia.isNotEmpty) {
          final stories = ref.read(storiesProvider);
          ref.read(storiesProvider.notifier).state = [
            Stories(username: ref.read(usernameProvider), media: carouselMedia),
            ...stories
          ];
        }

        if (nodes != null && nodes.isNotEmpty) {
          // Check that the nodes are not empty
          final oldEdges = ref.read(edgesProvider);
          final username = nodes.first.user.username;
          final oldEdgeUsername =
              oldEdges.where((e) => e.username == username).firstOrNull;

          if (oldEdgeUsername != null) {
            // Check if the new nodes already exists in the oldEdgeUsername based on code.
            final alreadyExists = oldEdgeUsername.nodes.any((oldNode) =>
                nodes.any((newNode) => newNode.code == oldNode.code));

            if (!alreadyExists) {
              // If the new nodes entry doesn't exist for a username
              final newNodes = [...nodes, ...oldEdgeUsername.nodes];
              final newEdges = oldEdges
                  .map((e) =>
                      e.username == username ? e.copyWith(nodes: newNodes) : e)
                  .toList();

              ref.read(edgesProvider.notifier).state = newEdges;
            }
          } else {
            // Add the first node entry
            final newEdges = Edge(username: username, nodes: nodes);
            ref.read(edgesProvider.notifier).state = [newEdges, ...oldEdges];
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
          var originalXHROpen = XMLHttpRequest.prototype.open;
          XMLHttpRequest.prototype.open = function() {
              var xhr = this;
              this.addEventListener('load', function() {
                  var currentUrl = window.location.href;

                  if (currentUrl === 'https://www.instagram.com/') {
                    // Don't save nodes from the home page
                    return;
                  }

                  if (xhr.responseURL.includes('https://www.instagram.com/graphql/query')) {
                    var responseJson = JSON.parse(xhr.responseText);

                    if (
                    !responseJson.data.hasOwnProperty('xdt_api__v1__feed__user_timeline_graphql_connection') ||
                    !responseJson.data.hasOwnProperty('xdt_api__v1__feed__reels_media')
                    ) {
                      return;
                    }

                    // Convert to string if necessary and chunk it
                    var responseString = JSON.stringify(responseJson);
                    var chunkSize = 10000; // Size of each chunk
                    var totalChunks = Math.ceil(responseString.length / chunkSize);
                    var chunks = [];
                    
                    for (var i = 0; i < totalChunks; i++) {
                      var chunk = responseString.slice(i * chunkSize, (i + 1) * chunkSize);
                      chunks.push(chunk)
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
