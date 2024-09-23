import 'package:story_saver_video_downloader/screens/settings_screen/widgets/app_setting.dart';
import 'package:story_saver_video_downloader/screens/settings_screen/widgets/download_location_setting.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 42),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 16),
          DownloadLocationSetting(),
          AppSetting(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Divider(thickness: 1, color: AppColors.darkGrey),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("MORE", style: TextStyle(color: AppColors.darkGrey)),
          ),
          SizedBox(
            height: 10,
          ),
          AppSetting(icon: Icons.star_border_outlined, title: "Rate Us"),
          AppSetting(icon: Icons.ios_share_outlined, title: "Share App"),
          AppSetting(icon: Icons.info_outline, title: "Share App"),
        ],
      )),
    );
  }
}
