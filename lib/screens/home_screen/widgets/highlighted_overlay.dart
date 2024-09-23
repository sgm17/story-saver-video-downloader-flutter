import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/providers/highlighted_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/highlights_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';

class HighlightedOverlay extends ConsumerWidget {
  const HighlightedOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highlightedYPosition = ref.watch(highlightedYPositionProvider);
    final scrollY = ref.watch(scrollYProvider);
    final highlights = ref.watch(highlightsProvider);

    return Transform.translate(
      offset: Offset(10, highlightedYPosition - scrollY),
      child: ListView.separated(
        itemCount: highlights.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 5,
          );
        },
        itemBuilder: (context, index) {
          return Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: Colors.red)),
          );
        },
      ),
    );
  }
}
