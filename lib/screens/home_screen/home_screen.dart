import 'package:story_saver_video_downloader/models/navigation_state.dart';
import 'package:story_saver_video_downloader/providers/navigation_state_provider.dart';
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
