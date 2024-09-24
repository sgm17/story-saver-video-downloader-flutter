import 'package:story_saver_video_downloader/domains/posts_repository/src/models/carousel_media.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/edge.dart';
import 'package:story_saver_video_downloader/models/highlight_carousel.dart';
import 'package:story_saver_video_downloader/models/highlight_node.dart';
import 'package:story_saver_video_downloader/domains/highlights_repository/src/models/highlight.dart';
import 'package:story_saver_video_downloader/models/navigation_state.dart';
import 'package:story_saver_video_downloader/domains/stories_repository/src/models/story.dart';
import 'package:story_saver_video_downloader/providers/highlighted_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/highlights_provider.dart';
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
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/node.dart';
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

        final username = ref.read(usernameProvider);

        switch (args[1]) {
          case "xdt_api__v1__feed__user_timeline_graphql_connection":
            // Edges Provider
            final edges = jsonObject["data"]
                    ["xdt_api__v1__feed__user_timeline_graphql_connection"]
                ["edges"] as List?;

            final nodes = edges?.map((e) => Node.fromJson(e['node'])).toList();

            if (nodes != null && nodes.isNotEmpty) {
              // Check that the nodes are not empty
              final oldEdges = ref.read(edgesProvider);
              final username = nodes.first.user.username;
              final oldEdgeUsername =
                  oldEdges.where((e) => e.username == username).firstOrNull;

              if (oldEdgeUsername != null) {
                // Check if the new nodes already exists in the oldEdgeUsername based on code.
                final usernameAlreadyExists = oldEdgeUsername.nodes.any(
                    (oldNode) =>
                        nodes.any((newNode) => newNode.code == oldNode.code));

                if (!usernameAlreadyExists) {
                  // If the new nodes entry doesn't exist for a username
                  final newNodes = [...nodes, ...oldEdgeUsername.nodes];
                  final newEdges = oldEdges
                      .map((e) => e.username == username
                          ? e.copyWith(nodes: newNodes)
                          : e)
                      .toList();

                  ref.read(edgesProvider.notifier).state = newEdges;
                }
              } else {
                // Add the first node entry
                final newEdges = Edge(username: username, nodes: nodes);
                ref.read(edgesProvider.notifier).state = [
                  newEdges,
                  ...oldEdges
                ];
              }
            }
            break;
          case "xdt_api__v1__feed__reels_media":
            // Stories Provider
            final items = jsonObject["data"]["xdt_api__v1__feed__reels_media"]
                ["reels_media"]["items"] as List?;

            final carouselMedia =
                items?.map((e) => CarouselMedia.fromJson(e)).toList();

            if (carouselMedia != null && carouselMedia.isNotEmpty) {
              final stories = ref.read(storiesProvider);
              final usernameAlreadyStored =
                  stories.any((e) => e.username == username);

              if (!usernameAlreadyStored) {
                final newStory = Stories(
                    username: ref.read(usernameProvider), media: carouselMedia);
                ref.read(storiesProvider.notifier).state = [
                  newStory,
                  ...stories
                ];
              }
            }
            break;
          case "highlights":
            // Highlights Provider
            final highlightEdges =
                jsonObject["data"]["highlights"]["edges"] as List?;
            final highlightNodes = highlightEdges
                ?.map((e) => HighlightNode.fromJson(e["node"]))
                .toList();

            if (highlightNodes != null && highlightNodes.isNotEmpty) {
              final highlights = ref.read(highlightsProvider);
              final alreadyStored =
                  highlights.any((e) => e.username == username);

              if (!alreadyStored) {
                final newHighlights =
                    Highlights(username: username, node: highlightNodes);
                ref.read(highlightsProvider.notifier).state = [
                  newHighlights,
                  ...highlights
                ];
              }
            }
          case "xdt_viewer":
            final carouselMediaJson = jsonObject["data"]
                    ["xdt_api__v1__feed__reels_media__connection"]["edges"][0]
                ["node"]["items"] as List?;

            final carouselMedia = carouselMediaJson
                ?.map((e) => HighlightCarousel.fromJson(e))
                .toList();

            final title = jsonObject["data"]
                    ["xdt_api__v1__feed__reels_media__connection"]["edges"][0]
                ["node"]["title"];

            final username = ref.read(usernameProvider);
            final highlights = ref.read(highlightsProvider);

            final node =
                highlights.where((e) => e.username == username).firstOrNull;

            if (node != null) {
              final stories =
                  node.node.where((e) => e.title == title).firstOrNull;

              if (stories != null) {
                // Create an updated version of the story with the new media
                final updatedStory = stories.copyWith(newMedia: carouselMedia);

                // Create an updated version of the node with the updated story
                final updatedNode = node.copyWith(
                    newNode: node.node
                        .map((e) => e.title == title ? updatedStory : e)
                        .toList());

                // Update the highlights list with the updated node
                final newHighlights = highlights
                    .map((e) => e.username == username ? updatedNode : e)
                    .toList();

                // Update the state of the highlightsProvider with the new highlights list
                ref.read(highlightsProvider.notifier).state = newHighlights;
              }
            }
            break;
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

              function getChunksFromResponse(responseJson) {
                // Convert to string if necessary and chunk it
                var responseString = JSON.stringify(responseJson);

                var chunkSize = 10000; // Size of each chunk
                var totalChunks = Math.ceil(responseString.length / chunkSize);
                var chunks = [];
                
                for (var i = 0; i < totalChunks; i++) {
                  var chunk = responseString.slice(i * chunkSize, (i + 1) * chunkSize);
                  chunks.push(chunk)
                }
                return chunks
              }

              this.addEventListener('load', function() {
                  var currentUrl = window.location.href;

                  if (currentUrl === 'https://www.instagram.com/') {
                    // Don't save nodes from the home page
                    return;
                  }

                  var responseJson = JSON.parse(xhr.responseText);

                  if (xhr.responseURL.includes('https://www.instagram.com/graphql/query')) {
                    // Query Request
                    if (responseJson.data.hasOwnProperty('xdt_api__v1__feed__user_timeline_graphql_connection') || responseJson.data.hasOwnProperty('xdt_api__v1__feed__reels_media') || responseJson.data.hasOwnProperty('highlights') || responseJson.data.hasOwnProperty('xdt_viewer')
                    ) {
                      const chunks = getChunksFromResponse(responseJson)
                      window.flutter_inappwebview.callHandler('interceptedGraphQl', chunks, Object.keys(responseJson.data)[0]);
                    }
                  }
              });
              originalXHROpen.apply(this, arguments);
          };
      })();
      """);
  }
}
