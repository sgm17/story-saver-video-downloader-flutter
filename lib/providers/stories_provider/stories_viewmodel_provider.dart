import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/stories_repository/stories_repository.dart';

final storiesViewmodelProvider =
    Provider<StoriesViewmodel>((ref) => StoriesViewmodel(ref: ref));
