import 'package:story_saver_video_downloader/models/navigation_state.dart';
import 'package:story_saver_video_downloader/providers/highlighted_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/navigation_state_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:story_saver_video_downloader/providers/story_y_position_provider.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/instagram_overlay.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/node_download.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/app_web_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationStateProvider);

    return Scaffold(
        body: SafeArea(
            child: Stack(clipBehavior: Clip.none, children: [
      const AppWebView(),
      // Display widgets depending on the Navigation State
      switch (navigation) {
        NavigationState.idle => const SizedBox.shrink(),
        NavigationState.profile => const InstagramOverlay(),
        NavigationState.post => const NodeDownload(),
      },
      StoryOverlay(),
      HighlightedOverlay(),
      // TODO: DELETE THIS
      Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                navigation.name.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            ],
          )),
    ])));
  }
}

class StoryOverlay extends ConsumerWidget {
  const StoryOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyYPosition = ref.watch(storyYPositionProvider);
    final scrollY = ref.watch(scrollYProvider);
    return Transform.translate(
      offset: Offset(16, storyYPosition + 3 - scrollY),
      child: Container(
        height: 77,
        width: 77,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.red)),
      ),
    );
  }
}

class HighlightedOverlay extends ConsumerWidget {
  const HighlightedOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highlightedYPosition = ref.watch(highlightedYPositionProvider);
    final scrollY = ref.watch(scrollYProvider);
    return Transform.translate(
      offset: Offset(10, highlightedYPosition - scrollY),
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.red)),
      ),
    );
  }
}
