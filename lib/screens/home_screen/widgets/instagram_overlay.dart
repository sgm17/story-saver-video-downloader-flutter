import 'package:story_saver_video_downloader/providers/initial_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/overflowed_rows_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:story_saver_video_downloader/providers/nodes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class InstagramOverlay extends ConsumerWidget {
  const InstagramOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialYPosition = ref.watch(initialYPositionProvider);
    final scrollY = ref.watch(scrollYProvider);
    final nodes = ref.watch(nodesProvider);

    final totalWidth = MediaQuery.of(context).size.width;
    final containerWidth = (totalWidth - (2 * 3)) / 3;
    final overflowedRows = ref.watch(overflowedRowsProvider(containerWidth));
    final itemsToRemove = overflowedRows * 3;

// Adjust the item count to account for the removed items
    final adjustedItemCount = (nodes.length > itemsToRemove)
        ? nodes.length - itemsToRemove
        : 0; // Prevent negative count

    final containerHeight = containerWidth + 2;

    final translationOffset =
        initialYPosition - scrollY + (overflowedRows * containerHeight);

    return Transform.translate(
      offset: Offset(0, translationOffset),
      child: IgnorePointer(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            childAspectRatio: 1,
          ),
          itemCount: adjustedItemCount,
          itemBuilder: (context, index) {
            return Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(
                    (index + itemsToRemove).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
