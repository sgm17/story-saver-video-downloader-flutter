import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:story_saver_video_downloader/providers/bottom_navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavigation = ref.watch(bottomNavigationProvider);
    final items = [
      {'name': 'Home', 'icon': 'assets/icons/home.svg'},
      {'name': 'Download', 'icon': 'assets/icons/download.svg'},
      {'name': 'Settings', 'icon': 'assets/icons/settings.svg'},
    ];

    final selectedIndex = items
        .indexWhere((item) => item['name']!.toLowerCase() == bottomNavigation);

    return Stack(
      children: [
        // Background Color
        Container(
          height: 60,
          color: Colors.black,
        ),
        // Sliding container
        AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment(-1.0 + (2 * selectedIndex / (items.length - 1)),
              0), // Animating alignment
          child: Container(
            width: MediaQuery.of(context).size.width / items.length,
            height: 60,
            decoration: const BoxDecoration(
              color: AppColors.black,
            ),
          ),
        ),
        // This Stack will hold the sliding black container and the navigation items
        SizedBox(
          height: 60,
          child: Row(
            children: List.generate(
              items.length,
              (index) => Expanded(
                child: BottomNavigationItem(
                  iconPath: items[index]['icon']!,
                  name: items[index]['name']!,
                  index: index,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
