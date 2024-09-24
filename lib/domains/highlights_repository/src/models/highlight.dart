import 'package:story_saver_video_downloader/domains/posts_repository/posts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'highlight.freezed.dart';
part 'highlight.g.dart';

@freezed
class Highlight with _$Highlight {
  const factory Highlight(
      {required String username,
      required List<Edge> edge,
      int? type,
      String? url}) = _Highlight;

  factory Highlight.fromJson(Map<String, dynamic> json) =>
      _$HighlightFromJson(json);
}
