import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/highlights_repository/src/models/highlight.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/posts_repository.dart';

class HighlightsNotifier extends StateNotifier<List<Highlight>> {
  final Ref ref;

  HighlightsNotifier(this.ref) : super([]);

  void addHighlights({required Highlight? highlight}) {
    if (highlight != null) {
      state = [highlight, ...state];
    }
  }

  void addCarouselToHighlight(
      {required String? username, required List<Node> edges}) {
    final newHighlight = state.where((e) => e.username == username).firstOrNull;

    if (newHighlight != null) {
      state = state
          .map((e) => e.username == username ? e.copyWith(edges: edges) : e)
          .toList();
    }
  }
}
