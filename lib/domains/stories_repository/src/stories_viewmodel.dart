import 'package:story_saver_video_downloader/domains/posts_repository/src/models/models.dart';
import 'package:story_saver_video_downloader/domains/stories_repository/stories_repository.dart';
import 'package:story_saver_video_downloader/providers/stories_provider/stories_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoriesViewmodel implements StoriesRepository {
  final Ref ref;

  StoriesViewmodel({required this.ref});

  @override
  void retrieveStories(
      {required String? username, required List<Node>? nodes}) {
    if (nodes != null) {
      final stories = ref.read(storiesProvider);
      final storiesAlreadyStored = stories.any((e) => e.username == username);

      if (!storiesAlreadyStored) {
        ref
            .read(storiesProvider.notifier)
            .addStories(username: username, nodes: nodes);
      }
    }
  }
}
