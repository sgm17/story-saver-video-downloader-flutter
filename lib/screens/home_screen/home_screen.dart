import 'package:story_saver_video_downloader/providers/username_provider.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/story_overlay.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/highlighted_overlay.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/instagram_overlay.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/app_web_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);

    return Scaffold(
        body: SafeArea(
            child: Stack(clipBehavior: Clip.none, children: [
      const AppWebView(),
      // Display widgets depending on the Navigation State
      if (username != null) const InstagramOverlay(),
      if (username != null) const StoryOverlay(),
      if (username != null) const HighlightedOverlay(),
    ])));
  }
}
