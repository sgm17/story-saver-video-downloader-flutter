import 'package:story_saver_video_downloader/domains/posts_repository/src/models/node.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/carousel_media.dart';
import 'package:story_saver_video_downloader/providers/highlighted_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/highlights_provider/highlights_viewmodel_provider.dart';
import 'package:story_saver_video_downloader/providers/is_story_active_provider.dart';
import 'package:story_saver_video_downloader/providers/posts_provider/posts_viewmodel_provider.dart';
import 'package:story_saver_video_downloader/providers/stories_provider/providers.dart';
import 'package:story_saver_video_downloader/providers/story_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/username_provider.dart';
import 'package:story_saver_video_downloader/providers/initial_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:story_saver_video_downloader/constants/constants.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class AppWebView extends ConsumerStatefulWidget {
  const AppWebView({super.key});

  @override
  ConsumerState<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends ConsumerState<AppWebView> {
  late GlobalKey _webViewKey;
  InAppWebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _webViewKey = GlobalKey();
  }

  @override
  void dispose() {
    _webViewKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(usernameProvider, listenUsernameChanges);

    return InAppWebView(
      key: _webViewKey,
      initialUrlRequest: URLRequest(url: WebUri(Constants.INITIAL_URL)),
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
      ),
      onUpdateVisitedHistory: onUpdateVisitedHistory,
      onWebViewCreated: onWebViewCreated,
      onScrollChanged: onScrollChanged,
      onLoadStop: onLoadStop,
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
    String? getUsernameFromUrl() {
      final RegExp regExp =
          RegExp(r'https:\/\/www\.instagram\.com\/([a-zA-Z0-9._]+)\/');
      // Use the regex to find matches
      final match = regExp.firstMatch(url.toString());
      // Select the username from the url
      final username = match?.group(1);

      return username;
    }

    final username = getUsernameFromUrl();
    final historyUrl = url.toString();

    if (historyUrl == "${Constants.INITIAL_URL}/$username/" ||
        historyUrl.contains("${Constants.INITIAL_URL}/stories")) {
      // https://www.instagram.com/username
      // https://www.instagram.com/stories/username
      // https://www.instagram.com/stories/highlights
      if (historyUrl == "${Constants.INITIAL_URL}/$username/") {
        ref.read(usernameProvider.notifier).state = username;
      }
    } else {
      ref.read(usernameProvider.notifier).state = null;
    }
  }

  void onWebViewCreated(InAppWebViewController controller) {
    setState(() {
      _controller = controller;
    });

    controller.addJavaScriptHandler(
        handlerName: "initialYPosition",
        callback: (args) {
          final value = args[0];

          ref.read(initialYPositionProvider.notifier).state = value is double
              ? value
              : (value is int)
                  ? value.toDouble()
                  : 0.0;
        });

    controller.addJavaScriptHandler(
        handlerName: "storyYPosition",
        callback: (args) {
          final value = args[0];

          ref.read(storyYPositionProvider.notifier).state = value is double
              ? value
              : (value is int)
                  ? value.toDouble()
                  : 0.0;
        });

    controller.addJavaScriptHandler(
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
    controller.addJavaScriptHandler(
        handlerName: "isActiveStory",
        callback: (args) {
          final value = args[0];
          if (value is bool) {
            ref.read(isStoryActiveProvider.notifier).state = value;
          }
        });

    controller.addJavaScriptHandler(
      handlerName: 'interceptedGraphQl',
      callback: (args) {
        final elements = args[0];

        String jsonString = elements.join("").replaceAll("\u0026", "&");

        final jsonObject = jsonDecode(jsonString) as Map<String, dynamic>;

        final username = ref.read(usernameProvider);

        switch (args[1]) {
          case "posts":
            final edges = jsonObject["data"]
                    ["xdt_api__v1__feed__user_timeline_graphql_connection"]
                ["edges"] as List?;

            final nodes = edges?.map((e) => Node.fromJson(e['node'])).toList();

            if (nodes?.isEmpty == false) {
              ref
                  .read(postsViewmodelProvider)
                  .retrievePosts(edge: nodes, username: username);
            }

            break;
          case "stories":
            // Stories Provider
            final items = jsonObject["data"]["xdt_api__v1__feed__reels_media"]
                ["reels_media"][0]["items"] as List?;
            final carouselMedia =
                items?.map((e) => CarouselMedia.fromJson(e)).toList();
            if (carouselMedia?.isEmpty == false) {
              ref.read(storiesViewmodelProvider).retrieveStories(
                  carouselMedia: carouselMedia, username: username);
            }
            break;
          case "highlights":
            final edges = jsonObject["data"]["highlights"]["edges"] as List?;
            final nodes = edges?.map((e) => Node.fromJson(e["node"])).toList();
            if (nodes?.isEmpty == false) {
              ref
                  .read(highlightsViewmodelProvider)
                  .retrieveHighlights(username: username, edges: nodes);
            }
            break;
          case "highlights_content":
            // Highlights Content
            final items = jsonObject["data"]
                    ["xdt_api__v1__feed__reels_media__connection"]["edges"][0]
                ["node"]["items"] as List?;

            final carouselMedia =
                items?.map((e) => CarouselMedia.fromJson(e)).toList();

            final title = jsonObject["data"]
                    ["xdt_api__v1__feed__reels_media__connection"]["edges"][0]
                ["node"]["title"];
            if (carouselMedia?.isEmpty == false) {
              ref.read(highlightsViewmodelProvider).retrieveHighlightsContent(
                  username: username,
                  title: title,
                  carouselMedia: carouselMedia);
            }
            break;
        }
        return null;
      },
    );

    _controller?.setSettings(
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
                  var responseJson = JSON.parse(xhr.responseText);

                  if (xhr.responseURL.includes('https://www.instagram.com/graphql/query')) {
                    // Query Request
                    if (responseJson.data.hasOwnProperty('xdt_api__v1__feed__user_timeline_graphql_connection')) {
                      const chunks = getChunksFromResponse(responseJson)
                      window.flutter_inappwebview.callHandler('interceptedGraphQl', chunks, "posts");
                    } else if (responseJson.data.hasOwnProperty('xdt_api__v1__feed__reels_media')) {
                      const chunks = getChunksFromResponse(responseJson)
                      window.flutter_inappwebview.callHandler('interceptedGraphQl', chunks, "stories");
                    } else if (responseJson.data.hasOwnProperty('highlights')) {
                      const chunks = getChunksFromResponse(responseJson)
                      window.flutter_inappwebview.callHandler('interceptedGraphQl', chunks, "highlights");
                    } else if (responseJson.data.hasOwnProperty('xdt_viewer') && responseJson.data.hasOwnProperty('xdt_api__v1__feed__reels_media__connection')) {
                      const chunks = getChunksFromResponse(responseJson)
                      window.flutter_inappwebview.callHandler('interceptedGraphQl', chunks, "highlights_content");
                    }
                  }
              });
              originalXHROpen.apply(this, arguments);
          };
      })();
      """);
  }

  listenUsernameChanges(previous, next) async {
    await _controller?.evaluateJavascript(source: """
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
