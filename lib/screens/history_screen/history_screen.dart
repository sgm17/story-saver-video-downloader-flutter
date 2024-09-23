import 'package:story_saver_video_downloader/screens/history_screen/widgets/pictures_screen.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/stories_screen.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/videos_screen.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 42),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "Downloads",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 16),
            TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w500),
                unselectedLabelStyle: TextStyle(color: AppColors.darkGrey),
                indicatorColor: AppColors.primaryColor,
                tabs: [
                  Tab(text: "Pictures"),
                  Tab(text: "Videos"),
                  Tab(text: "Stories"),
                ]),
            Expanded(
              child: TabBarView(children: [
                PicturesScreen(),
                VideosScreen(),
                StoriesScreen()
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
