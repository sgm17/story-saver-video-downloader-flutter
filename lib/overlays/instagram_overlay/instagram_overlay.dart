import 'package:story_saver_video_downloader/overlays/instagram_overlay/post_item.dart';
import 'package:story_saver_video_downloader/providers/initial_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/overflowed_rows_provider.dart';
import 'package:story_saver_video_downloader/providers/posts_provider/providers.dart';
import 'package:story_saver_video_downloader/providers/username_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class InstagramOverlay extends ConsumerWidget {
  const InstagramOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialYPosition = ref.watch(initialYPositionProvider);
    final scrollY = ref.watch(scrollYProvider);
    final postsData = ref.watch(postsProvider);
    final username = ref.watch(usernameProvider);

    final posts = postsData.where((e) => e.username == username).firstOrNull;

    if (posts == null) {
      return const SizedBox.shrink();
    }

    final totalWidth = MediaQuery.of(context).size.width;
    final containerWidth = (totalWidth - (2 * 3)) / 3;
    final overflowedRows = ref.watch(overflowedRowsProvider(containerWidth));
    final itemsToRemove = overflowedRows * 3;

    // Adjust the item count to account for the removed items
    final adjustedItemCount = (posts.edges.length > itemsToRemove)
        ? posts.edges.length - itemsToRemove
        : 0; // Prevent negative count

    final containerHeight = containerWidth + 2;

    final translationOffset =
        initialYPosition - scrollY + (overflowedRows * containerHeight);

    return Transform.translate(
      offset: Offset(0, translationOffset),
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
          return const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8, right: 8),
              child: PostItem(),
            ),
          );
        },
      ),
    );
  }
}
