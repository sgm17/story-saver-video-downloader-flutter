import 'package:story_saver_video_downloader/providers/bottom_navigation_provider.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends ConsumerWidget {
  const BottomNavigationItem(
      {super.key,
      required this.iconPath,
      required this.name,
      required this.index});

  final String iconPath, name;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(bottomNavigationProvider.notifier).state =
          name.toLowerCase(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 21,
            width: 21,
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
