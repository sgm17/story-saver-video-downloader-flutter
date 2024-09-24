import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/posts_repository.dart';
import 'package:story_saver_video_downloader/providers/posts_provider/posts_notifier.dart';

final postsProvider = StateNotifierProvider<PostsNotifier, List<Post>>(
    (ref) => PostsNotifier(ref));
