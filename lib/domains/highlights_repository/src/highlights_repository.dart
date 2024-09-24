import 'package:story_saver_video_downloader/domains/posts_repository/src/models/models.dart';

abstract class HighlightsRepository {
  void retrieveHighlights(
      {required String? username, required List<Node>? edges});
  void retrieveHighlightsContent(
      {required String username,
      required String title,
      required List<CarouselMedia> carouselMedia});
}
