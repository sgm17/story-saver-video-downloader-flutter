import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/pop_menu.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.image, required this.filename});

  final String image, filename;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4),
            blurRadius: 2,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(filename,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12)),
                ),
                const Flexible(child: PopMenu())
              ],
            ),
          )
        ],
      ),
    );
  }
}
