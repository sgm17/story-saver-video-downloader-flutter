import 'package:story_saver_video_downloader/providers/username_provider.dart';
import 'package:story_saver_video_downloader/providers/img_index_provider.dart';
import 'package:story_saver_video_downloader/providers/edges_provider.dart';
import 'package:story_saver_video_downloader/providers/code_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/download_progress.dart';

class NodeDownload extends ConsumerWidget {
  const NodeDownload({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final edges = ref.watch(edgesProvider);
    final username = ref.watch(usernameProvider);
    final code = ref.watch(codeProvider);
    final imgIndex = ref.watch(imgIndexProvider);

    // Select edge depending the current username
    final edge = edges.where((e) => e.username == username).firstOrNull;
    // Select node depending on the code
    final node = edge?.nodes.where((e) => e.code == code).firstOrNull;
    // Select the carousel images if they exist
    final media = node?.carouselMedia;

    if (media == null ||
        media[imgIndex].mediaType == 2 && media[imgIndex].videos == null) {
      // Has no multiple images or there is no video available
      return node != null
          ? IgnorePointer(
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.network(node.imageVersions[2].url),
                ),
              ),
            )
          : const SizedBox.shrink();
    }

    if (media[imgIndex].mediaType == 2) {
      final videoUrl = media[imgIndex].videos!.first.url;
      return Center(
          child: Column(
        children: [
          Text(
            videoUrl,
            style: const TextStyle(color: Colors.red),
          ),
          TextButton(
              onPressed: () async {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (dialogContext) {
                      return DownloadProgress(
                          url: videoUrl, dialogContext: dialogContext);
                    });
              },
              child: const Text("Download Video!"))
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
