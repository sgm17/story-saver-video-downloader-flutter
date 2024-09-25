import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:story_saver_video_downloader/screens/dragabble_screen/dragabble_screen.dart';

import '../../screens/dragabble_screen/widgets/widgets.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async =>
          await DraggableMenu.open(context, const DraggableScreen()),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.primaryColor,
        ),
        child: const Icon(
          Icons.download,
          color: Colors.white,
          size: 23,
        ),
      ),
    );
  }
}
