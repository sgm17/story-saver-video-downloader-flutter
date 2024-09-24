import 'package:story_saver_video_downloader/domains/posts_repository/posts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsNotifier extends StateNotifier<List<Post>> {
  final Ref ref;

  PostsNotifier(this.ref) : super([]);

  void addPosts({required List<Node> edges, required String? username}) {
    final userPosts = state.where((e) => e.username == username).firstOrNull;

    if (userPosts != null) {
      final newUserPosts = userPosts.copyWith(edges: edges);

      state =
          state.map((e) => e.username == username ? newUserPosts : e).toList();
    }
  }
}
