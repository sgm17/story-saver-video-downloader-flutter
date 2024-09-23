import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/picture_item.dart';

class PicturesScreen extends StatelessWidget {
  const PicturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemBuilder: (context, index) {
          return const PictureItem(
            image: "assets/images/hq720.jpg",
            filename: 'hola.mp4',
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemCount: 22);
  }
}
