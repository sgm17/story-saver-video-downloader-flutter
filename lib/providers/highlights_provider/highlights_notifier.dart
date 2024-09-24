import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/highlights_repository/src/models/highlight.dart';

class HighlightsNotifier extends StateNotifier<List<Highlight>> {
  final Ref ref;

  HighlightsNotifier(this.ref) : super([]);
}
