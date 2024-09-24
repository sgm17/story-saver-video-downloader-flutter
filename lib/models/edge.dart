import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_saver_video_downloader/models/node.dart';
part 'edge.freezed.dart';
part 'edge.g.dart';

@freezed
class Edge with _$Edge {
  const factory Edge({required List<Node> nodes}) = _Edge;

  factory Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);
}
