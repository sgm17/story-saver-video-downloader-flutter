import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:story_saver_video_downloader/models/highlight_node.dart';
import 'package:story_saver_video_downloader/providers/highlighted_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/highlights_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:story_saver_video_downloader/providers/username_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HighlightedOverlay extends ConsumerStatefulWidget {
  const HighlightedOverlay({super.key});

  @override
  ConsumerState<HighlightedOverlay> createState() => _HighlightedOverlayState();
}

class _HighlightedOverlayState extends ConsumerState<HighlightedOverlay> {
  HighlightNode? highlightNode;

  @override
  Widget build(BuildContext context) {
    final highlightedYPosition = ref.watch(highlightedYPositionProvider);
    final scrollY = ref.watch(scrollYProvider);
    final highlights = ref.watch(highlightsProvider);
    final username = ref.watch(usernameProvider);
    final usernameHighlights =
        highlights.where((e) => e.username == username).firstOrNull;

    if (usernameHighlights == null) {
      return const SizedBox.shrink();
    }

    final items = usernameHighlights.node
        .map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )))
        .toList();

    return Transform.translate(
      offset: Offset(10, highlightedYPosition - scrollY + 32 + 56),
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            if (highlightNode == null)
              Container(
                  height: 56,
                  width: 56,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle))
            else
              SizedBox(
                height: 56,
                width: 56,
                child: ClipOval(
                  child: Image.network(highlightNode!.image),
                ),
              ),
            const SizedBox(
              width: 23,
            ),
            DropdownButton<HighlightNode>(
                value: highlightNode,
                items: items,
                dropdownColor: AppColors.black,
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    highlightNode = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
