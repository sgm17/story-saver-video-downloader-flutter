import 'package:story_saver_video_downloader/domains/posts_repository/src/models/models.dart';
import 'package:story_saver_video_downloader/domains/stories_repository/stories_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoriesNotifier extends StateNotifier<List<Story>> {
  final Ref ref;

  StoriesNotifier(this.ref) : super([]);

  void addStories({required String? username, required List<Node> nodes}) {
    if (username != null) {
      final newStory = Story(username: username, edges: nodes);
      state = [newStory, ...state];
    }
  }
}
