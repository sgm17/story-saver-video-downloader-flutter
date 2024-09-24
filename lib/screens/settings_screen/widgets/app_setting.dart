import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:flutter/material.dart';

class AppSetting extends ConsumerWidget {
  const AppSetting({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => print("Example"),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Row(
          children: [
            Icon(icon, size: 21),
            const SizedBox(
              width: 16,
            ),
            Text(title,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
