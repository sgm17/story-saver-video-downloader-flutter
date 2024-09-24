import 'package:story_saver_video_downloader/providers/is_story_active_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:story_saver_video_downloader/providers/story_y_position_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class StoryOverlay extends ConsumerWidget {
  const StoryOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyYPosition = ref.watch(storyYPositionProvider);
    final scrollY = ref.watch(scrollYProvider);
    final isStoryActive = ref.watch(isStoryActiveProvider);

    if (!isStoryActive) {
      return SizedBox.shrink();
    }

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
