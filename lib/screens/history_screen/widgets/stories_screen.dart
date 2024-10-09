import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/providers/history_provider/stories_provider.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/story_item.dart';

class StoriesScreen extends ConsumerWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stories = ref.watch(storiesHistoryProvider);

    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2 / 3,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          final story = stories[index];
          final filename =
              "${story["index"]}_${story["batchName"]}_${story["ext"]}";
          return StoryItem(
            image: story["url"],
            filename: filename,
          );
        });
  }
}
