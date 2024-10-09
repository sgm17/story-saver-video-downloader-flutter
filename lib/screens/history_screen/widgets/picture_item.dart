import 'package:story_saver_video_downloader/screens/history_screen/widgets/pop_menu.dart';
import 'package:flutter/material.dart';

class PictureItem extends StatelessWidget {
  const PictureItem({super.key, required this.filename, required this.image});

  final String filename, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            )
          ],
          color: Colors.white),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(filename,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          const Expanded(child: SizedBox.shrink()),
          const PopMenu()
        ],
      ),
    );
  }
}
