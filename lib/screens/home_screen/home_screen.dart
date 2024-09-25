import 'package:story_saver_video_downloader/providers/bottom_navigation_provider.dart';
import 'package:story_saver_video_downloader/providers/highlights_provider/highlights_provider.dart';
import 'package:story_saver_video_downloader/providers/is_story_active_provider.dart';
import 'package:story_saver_video_downloader/providers/posts_provider/providers.dart';
import 'package:story_saver_video_downloader/providers/username_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);
    final posts = ref.watch(postsProvider);
    final highlights = ref.watch(highlightsProvider);
    final isHighlightsUsername = highlights.any((e) => e.username == username);
    final isStoryActive = ref.watch(isStoryActiveProvider);
    final bottomNavigation = ref.watch(bottomNavigationProvider);

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        if (bottomNavigation == "home")
          Expanded(
            child: Stack(children: [
              const AppWebView(),
              // Display widgets depending on the Navigation State
              if (username != null && posts.isNotEmpty)
                const InstagramOverlay(),
              if (username != null && isStoryActive) const StoryOverlay(),
              if (username != null && isHighlightsUsername)
                const HighlightsOverlay(),
            ]),
          ),
        const BottomNavigation()
      ],
    )));
  }
}
