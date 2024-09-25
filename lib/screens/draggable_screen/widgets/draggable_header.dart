import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/app_colors.dart';

class DraggableHeader extends StatelessWidget {
  const DraggableHeader({
    super.key,
    required this.firstImage,
    required this.batchName,
  });

  final String firstImage, batchName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 80,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(firstImage, fit: BoxFit.cover)),
            )),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(batchName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 3),
            const Text("Batch",
                style: TextStyle(fontSize: 12, color: AppColors.primaryColor))
          ],
        )
      ],
    );
  }
}
