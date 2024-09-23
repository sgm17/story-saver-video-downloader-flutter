import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/pop_menu.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key, required this.image, required this.filename});

  final String image, filename;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
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
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Image.asset(image, fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
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
        ));
  }
}
