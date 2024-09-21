import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/app_web_view.dart';
import 'package:story_saver_video_downloader/screens/home_screen/widgets/instagram_overlay.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Stack(clipBehavior: Clip.none, children: [
      AppWebView(),
      InstagramOverlay(),
    ])));
  }
}
