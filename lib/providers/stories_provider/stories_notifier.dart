import 'package:story_saver_video_downloader/domains/stories_repository/stories_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoriesNotifier extends StateNotifier<List<Story>> {
  final Ref ref;

  StoriesNotifier(this.ref) : super([]);
}
