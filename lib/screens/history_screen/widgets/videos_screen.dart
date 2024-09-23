import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/video_item.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2 / 3,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return const VideoItem(
            image: "assets/images/hq720.jpg",
            filename: 'hola.mp4',
          );
        });
  }
}
