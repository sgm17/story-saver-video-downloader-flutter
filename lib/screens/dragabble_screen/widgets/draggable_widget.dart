import 'package:story_saver_video_downloader/screens/dragabble_screen/widgets/batch_item.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int numberElements = 9;
    final totalHeight = MediaQuery.of(context).size.height;

    final listViewHeight = numberElements * (60 + 12) > totalHeight / 2
        ? totalHeight / 2
        : (numberElements * (60 + 12).toDouble());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  height: 80,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/images/hq720.jpg",
                            fit: BoxFit.cover)),
                  )),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("12420942349032094",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 3),
                  Text("Batch",
                      style: TextStyle(
                          fontSize: 12, color: AppColors.primaryColor))
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: AppColors.lightGrey, thickness: 1),
          ),
          const Text("BATCH", style: TextStyle(color: AppColors.darkGrey)),
          const SizedBox(height: 10),
          SizedBox(
            height: listViewHeight,
            child: ListView.separated(
              itemCount: numberElements,
              itemBuilder: (context, index) {
                return const BatchItem(
                    image: "assets/images/hq720.jpg",
                    filename: "172447384877328",
                    mediaType: 1,
                    width: 1080,
                    height: 1080);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
            ),
          ),
          const SizedBox(height: 23),
        ],
      ),
    );
  }
}
