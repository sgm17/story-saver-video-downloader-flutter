import 'package:story_saver_video_downloader/providers/history_provider/providers.dart';
import 'package:story_saver_video_downloader/providers/shared_preferences_provider/providers.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/pictures_screen.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/stories_screen.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/videos_screen.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferencesViewmodel = ref.read(sharedPreferencesViewmodelProvider);
    final stories = preferencesViewmodel.retrieveStories();
    final videos = preferencesViewmodel.retrieveVideos();
    final pictures = preferencesViewmodel.retrievePictures();

    return Scaffold(
        body: SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 42),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "Downloads",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 16),
            const TabBar(
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
                ProviderScope(overrides: [
                  storiesHistoryProvider.overrideWithValue(pictures)
                ], child: const PicturesScreen()),
                ProviderScope(
                    overrides: [videosProvider.overrideWithValue(videos)],
                    child: const VideosScreen()),
                ProviderScope(overrides: [
                  storiesHistoryProvider.overrideWithValue(stories)
                ], child: const StoriesScreen())
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
