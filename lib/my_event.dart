import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/images_screen.dart';
import 'package:story_saver_video_downloader/media_type.dart';
import 'package:story_saver_video_downloader/providers/ajax_stream_provider.dart';
import 'package:story_saver_video_downloader/providers/media_provider.dart';
import 'package:story_saver_video_downloader/providers/xhr_stream_provider.dart';

class MyEvent extends ConsumerStatefulWidget {
  const MyEvent({super.key});

  @override
  ConsumerState<MyEvent> createState() => _MyEventState();
}

class _MyEventState extends ConsumerState<MyEvent> {
  late InAppWebViewController webViewController;
  String visitedHistory = "";
  String username = "";
  bool alreadyReloaded = false;
  MediaType mediaType = MediaType.unknown;
  final GlobalKey webViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: InAppWebView(
                key: webViewKey,
                initialUrlRequest:
                    URLRequest(url: WebUri("https://www.instagram.com/")),
                initialSettings: InAppWebViewSettings(
                  javaScriptEnabled: true,
                ),
                onUpdateVisitedHistory: (controller, url, isReload) async {
                  final stringUrl = url.toString();
                  final oldMediaType = mediaType;

                  if (stringUrl.contains("https://www.instagram.com/p/") &&
                      !visitedHistory
                          .contains("https://www.instagram.com/p/")) {
                    controller.reload();
                  }

                  // We are inside a profile
                  if (stringUrl.contains("https://www.instagram.com/p/")) {
                    setState(() {
                      mediaType = MediaType.publication;
                    });
                  } else if (stringUrl
                      .contains("https://www.instagram.com/reel/")) {
                    setState(() {
                      mediaType = MediaType.reel;
                    });
                  } else if (stringUrl.contains(
                      "https://www.instagram.com/stories/highlights/")) {
                    setState(() {
                      mediaType = MediaType.highlightedStory;
                    });
                  } else if (stringUrl
                      .contains("https://www.instagram.com/stories/")) {
                    setState(() {
                      mediaType = MediaType.story;
                    });
                  } else {
                    setState(() {
                      mediaType = MediaType.unknown;
                    });
                  }

                  if (mediaType != oldMediaType) {
                    ref.read(mediaProvider.notifier).clean();
                  }

                  setState(() {
                    visitedHistory = url.toString();
                  });
                },
                shouldInterceptRequest: (controller, request) {
                  // Check if the request URL matches the specific pattern
                  final requestUrl = request.url.toString();
                  if (requestUrl.contains("instagram.fzrh5-1.fna.fbcdn.net") &&
                      requestUrl.contains("stp") &&
                      requestUrl.contains("efg") &&
                      requestUrl.contains("edm") &&
                      requestUrl.contains("ccb") &&
                      requestUrl.contains("oh") &&
                      requestUrl.contains("oe")) {
                    if (mediaType != MediaType.unknown) {
                      print("New image: $mediaType $visitedHistory");
                      ref.read(ajaxStreamProvider).add(requestUrl);
                    }
                  }
                  // Continue loading the request as usual
                  return Future.value(null);
                },
                onWebViewCreated: (controller) {
                  webViewController = controller;

                  webViewController.addJavaScriptHandler(
                    handlerName: 'interceptedXHR',
                    callback: (args) {
                      final String data = args[0];
                      ref.read(xhrStreamProvider).add(data);
                    },
                  );

                  webViewController.setSettings(
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
                                                  //console.log('Intercepted Fetch URL with bytestart and byteend:', requestUrl);
                                                  
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
                                              if (xhr.responseURL.includes('https://instagram.fzrh5-1.fna.fbcdn.net/')) {
                                                  //console.log('Intercepted XHR URL with bytestart and byteend:', xhr.responseURL);
                                                  //console.log('XHR Response Body:', xhr.responseText);
                                              }
                                          });
                                          originalXHROpen.apply(this, arguments);
                                      };
                                  })();
                                  """);
                },
              ),
            ),
            SizedBox(
              height: 100,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ImagesScreen()));
                  },
                  child: const Text("Images Screen")),
            )
          ],
        ),
      ),
    );
  }
}
