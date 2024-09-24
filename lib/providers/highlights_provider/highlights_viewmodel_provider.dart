import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/highlights_repository/highlights_repository.dart';

final highlightsViewmodelProvider =
    Provider<HighlightsViewmodel>((ref) => HighlightsViewmodel(ref: ref));
