import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/highlights_repository/highlights_repository.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/carousel_media.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/node.dart';
import 'package:story_saver_video_downloader/providers/highlights_provider/highlights_provider.dart';

class HighlightsViewmodel implements HighlightsRepository {
  final Ref ref;

  HighlightsViewmodel({required this.ref});

  @override
  void retrieveHighlights(
      {required String? username, required List<Node>? edges}) {
    if (edges != null) {
      final highlights = ref.read(highlightsProvider);
      final alreadyStored = highlights.any((e) => e.username == username);

      if (!alreadyStored && username != null) {
        final newHighlight = Highlight(username: username, edges: edges);
        ref
            .read(highlightsProvider.notifier)
            .addHighlights(highlight: newHighlight);
      }
    }
  }

  @override
  void retrieveHighlightsContent(
      {required String? username,
      required String title,
      required List<CarouselMedia>? carouselMedia}) {
    if (carouselMedia != null) {
      final highlights = ref.read(highlightsProvider);
      final userHighlights =
          highlights.where((e) => e.username == username).firstOrNull;

      if (userHighlights != null) {
        final nodes =
            userHighlights.edges.where((e) => e.title == title).firstOrNull;

        if (nodes != null) {
          final updatedNode = nodes.copyWith(carouselMedia: carouselMedia);
          final updatedEdges = userHighlights.edges
              .map((e) => e.title == title ? updatedNode : e)
              .toList();
          ref
              .read(highlightsProvider.notifier)
              .addCarouselToHighlight(username: username, edges: updatedEdges);
        }
      }
    }
  }
}
