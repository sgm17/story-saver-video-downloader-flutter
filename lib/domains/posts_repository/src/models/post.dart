import 'package:freezed_annotation/freezed_annotation.dart';
import 'models.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({required String username, required List<Node> edges}) =
      _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
