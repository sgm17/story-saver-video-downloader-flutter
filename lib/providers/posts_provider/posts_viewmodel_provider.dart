import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/posts_repository.dart';

final postsViewmodelProvider =
    Provider<PostsViewmodel>((ref) => PostsViewmodel(ref: ref));
