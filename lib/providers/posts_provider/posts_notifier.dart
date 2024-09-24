import 'package:story_saver_video_downloader/domains/posts_repository/posts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsNotifier extends StateNotifier<List<Post>> {
  final Ref ref;

  PostsNotifier(this.ref) : super([]);
}
