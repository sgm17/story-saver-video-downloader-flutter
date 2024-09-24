import 'package:story_saver_video_downloader/domains/posts_repository/src/models/carousel_media.dart';

abstract class StoriesRepository {
  void retrieveStories(
      {required String? username, required List<CarouselMedia>? carouselMedia});
}
