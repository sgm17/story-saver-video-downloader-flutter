import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:story_saver_video_downloader/models/media_type.dart';

class BatchItem extends StatefulWidget {
  const BatchItem(
      {super.key,
      required this.image,
      required this.filename,
      required this.type,
      required this.width,
      required this.height});

  final String image, filename;
  final MediaType type;
  final int width, height;

  @override
  State<BatchItem> createState() => _BatchItemState();
}

class _BatchItemState extends State<BatchItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: Image.asset(widget.image, fit: BoxFit.cover)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.type.name,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      widget.filename,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "${widget.width}x${widget.height}",
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
              value: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  if (value != null) {
                    isSelected = value;
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
