import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/stories_repository/stories_repository.dart';
import 'package:story_saver_video_downloader/providers/stories_provider/stories_notifier.dart';

final storiesProvider = StateNotifierProvider<StoriesNotifier, List<Story>>(
    (ref) => StoriesNotifier(ref));
