import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/posts_repository.dart';
import 'package:story_saver_video_downloader/providers/highlighted_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/highlights_provider/highlights_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:story_saver_video_downloader/providers/username_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HighlightsOverlay extends ConsumerStatefulWidget {
  const HighlightsOverlay({super.key});

  @override
  ConsumerState<HighlightsOverlay> createState() => _HighlightsOverlayState();
}

class _HighlightsOverlayState extends ConsumerState<HighlightsOverlay> {
  Node? selectedNode;

  @override
  Widget build(BuildContext context) {
    final highlightedYPosition = ref.watch(highlightedYPositionProvider);
    final scrollY = ref.watch(scrollYProvider);

    final highlights = ref.watch(highlightsProvider);
    final username = ref.watch(usernameProvider);
    final usernameHighlights =
        highlights.where((e) => e.username == username).firstOrNull;

    final items = usernameHighlights?.edges
        .map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e.title ?? "",
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
            if (selectedNode == null || selectedNode?.coverMedia == null)
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
                  child: Image.network(
                      selectedNode!.coverMedia!.croppedImageVersion.url),
                ),
              ),
            const SizedBox(
              width: 23,
            ),
            DropdownButton<Node>(
                value: selectedNode,
                items: items,
                dropdownColor: AppColors.black,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    selectedNode = value;
                  });
                }),
            const SizedBox(
              width: 8,
            ),
            if (selectedNode?.carouselMedia == null)
              Container(
                padding: const EdgeInsets.all(6),
                color: Colors.black,
                child: const Text(
                  "No data. Enter the\nstory to download it",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              )
          ],
        ),
      ),
    );
  }
}
