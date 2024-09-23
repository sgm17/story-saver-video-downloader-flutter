import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/app_colors.dart';

class AppSetting extends StatelessWidget {
  const AppSetting({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("xd"),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Row(
          children: [
            Icon(icon, size: 21),
            SizedBox(
              width: 16,
            ),
            Text(title,
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
