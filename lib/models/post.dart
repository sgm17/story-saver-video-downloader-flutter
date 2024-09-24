import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_saver_video_downloader/models/edge.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({required String username, required List<Edge> edges}) =
      _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
