import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/models.dart';

class DraggableItem extends StatelessWidget {
  const DraggableItem(
      {super.key,
      required this.filename,
      required this.node,
      required this.selectIdNodes,
      required this.onTapDraggableItem});

  final String filename;
  final Node node;
  final List<String> selectIdNodes;
  final void Function({required String id}) onTapDraggableItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapDraggableItem(id: node.id),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: Image.network(node.imageVersions2!.candidates.first.url,
                    fit: BoxFit.cover)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      node.mediaType == 1 ? "Image" : "Video",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      filename,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "${node.originalWidth}x${node.originalHeight}",
                      style: const TextStyle(
                          color: AppColors.lightGrey, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Checkbox(
                checkColor: Colors.white,
                activeColor: AppColors.primaryColor,
                value: selectIdNodes.contains(node.id),
                onChanged: (bool? _) => onTapDraggableItem(id: node.id))
          ],
        ),
      ),
    );
  }
}
