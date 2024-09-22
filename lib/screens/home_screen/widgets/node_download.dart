import 'package:story_saver_video_downloader/providers/xhr_stream_provider.dart';
import 'package:story_saver_video_downloader/providers/img_index_provider.dart';
import 'package:story_saver_video_downloader/providers/nodes_provider.dart';
import 'package:story_saver_video_downloader/providers/code_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:story_saver_video_downloader/utils/download_video.dart';

class NodeDownload extends ConsumerStatefulWidget {
  const NodeDownload({super.key});

  @override
  ConsumerState<NodeDownload> createState() => _NodeDownloadState();
}

class _NodeDownloadState extends ConsumerState<NodeDownload> {
  String? videoUrl;
  late StreamSubscription<String> xhrStreamSubscription;

  @override
  void initState() {
    super.initState();
    xhrStreamSubscription = ref.read(xhrStreamProvider).stream.listen((event) {
      videoUrl = event;
    });
  }

  @override
  void dispose() {
    super.dispose();
    xhrStreamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final nodes = ref.watch(nodesProvider);
    final code = ref.watch(codeProvider);
    final imgIndex = ref.watch(imgIndexProvider);

    print("IMG INDEX: $imgIndex");

    // Corresponding images for the current code
    final node = nodes.where((element) => element.code == code).first;
    // Select the carousel images if they exist
    final media = node.carouselMedia;

    if (media == null) {
      // Is not a carousel, so select a single image
      return IgnorePointer(
        child: Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image.network(node.imageVersions[2].url),
          ),
        ),
      );
    }

    if (media[imgIndex].mediaType == 2) {
      return Center(
          child: Column(
        children: [
          Text(
            videoUrl ?? "",
            style: TextStyle(color: Colors.red),
          ),
          TextButton(
              onPressed: () async => await downloadFileUsingHttp(videoUrl!),
              child: Text("Download Video!"))
        ],
      ));
    }

    return Expanded(
        child: Align(
      alignment: Alignment.topRight,
      child: IgnorePointer(
          child: SizedBox(
        height: 150,
        width: 150,
        child: Image.network(media[imgIndex].images[2].url),
      )),
    ));
  }
}
