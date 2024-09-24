import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/carousel_media.dart';
import 'package:story_saver_video_downloader/domains/stories_repository/stories_repository.dart';
import 'package:story_saver_video_downloader/providers/stories_provider/stories_provider.dart';

class StoriesViewmodel implements StoriesRepository {
  final Ref ref;

  StoriesViewmodel({required this.ref});

  @override
  void retrieveStories(
      {required String? username,
      required List<CarouselMedia>? carouselMedia}) {
    if (carouselMedia != null) {
      final stories = ref.read(storiesProvider);
      final storiesAlreadyStored = stories.any((e) => e.username == username);

      if (!storiesAlreadyStored && username != null) {
        final newStory = Story(username: username, media: carouselMedia);
        ref.read(storiesProvider.notifier).addStories(story: newStory);
      }
    }
  }
}
