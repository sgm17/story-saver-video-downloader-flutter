import 'package:story_saver_video_downloader/providers/highlights_provider/providers.dart';
import 'package:story_saver_video_downloader/domains/highlights_repository/src/models/highlight.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final highlightsProvider =
    StateNotifierProvider<HighlightsNotifier, List<Highlight>>(
        (ref) => HighlightsNotifier(ref));
