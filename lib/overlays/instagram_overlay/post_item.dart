import 'package:story_saver_video_downloader/domains/posts_repository/src/models/models.dart';
import 'package:story_saver_video_downloader/screens/draggable_screen/draggable_screen.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await DraggableMenu.open(context,
          DraggableScreen(type: Post, index: index, draggableContext: context)),
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
