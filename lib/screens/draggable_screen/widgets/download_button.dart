import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/models.dart';

class DownloadButton extends ConsumerWidget {
  const DownloadButton(
      {super.key,
      required this.numberElements,
      required this.edges,
      required this.type});

  final int numberElements;
  final List<Node> edges;
  final Object type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        switch (type) {
          case const (Post):
            final urlsToDownload = edges.map((e) {
              if (e.mediaType == 2) {
                return e.videosVersions!.first.url;
              } else {
                return e.imageVersions2!.candidates.first.url;
              }
            });
            print("URLS: $urlsToDownload");
            break;
          default:
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Download $numberElements items",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
