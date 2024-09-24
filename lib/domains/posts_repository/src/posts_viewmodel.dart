import 'package:story_saver_video_downloader/domains/posts_repository/posts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/providers/posts_provider/providers.dart';

class PostsViewmodel implements PostsRepository {
  final Ref ref;

  PostsViewmodel({required this.ref});

  @override
  void retrievePosts({required List<Node>? edge, required String? username}) {
    if (edge != null && edge.isNotEmpty) {
      // Check that the nodes are not empty
      final postsData = ref.read(postsProvider);
      final posts = postsData.where((e) => e.username == username).firstOrNull;

      if (posts != null) {
        // Check if the new nodes already exist
        final edgeAlreadyStored = posts.edges
            .any((node) => edge.any((newNode) => newNode.code == node.code));

        if (!edgeAlreadyStored) {
          // The new edges are not stored yet. Store them
          final newEdge = [...edge, ...posts.edges];

          ref
              .read(postsProvider.notifier)
              .addPosts(edges: newEdge, username: username);
        }
      } else {
        // No entry for the given username. Store all
        ref
            .read(postsProvider.notifier)
            .addPosts(edges: edge, username: username);
      }
    }
  }
}
