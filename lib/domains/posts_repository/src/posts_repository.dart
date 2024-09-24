import 'package:story_saver_video_downloader/domains/posts_repository/src/models/models.dart';

abstract class PostsRepository {
  void retrievePosts({required List<Node> edge, required String username});
}
