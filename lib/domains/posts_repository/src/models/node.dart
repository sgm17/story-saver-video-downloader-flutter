import 'package:story_saver_video_downloader/domains/highlights_repository/highlights_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'models.dart';
part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  const factory Node({
    required String id,
    required User user,
    String? code,
    @JsonKey(name: "image_versions2") ImageVersions2? imageVersions2,
    String? title,
    @JsonKey(name: "carousel_media") List<CarouselMedia>? carouselMedia,
    @JsonKey(name: "cover_media") CoverMedia? coverMedia,
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
