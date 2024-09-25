import 'package:story_saver_video_downloader/domains/highlights_repository/highlights_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'models.dart';
part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  const factory Node(
      {required String id,
      required User user,
      String? title,
      @JsonKey(name: "media_type") required int mediaType,
      @JsonKey(name: "original_height") required int originalHeight,
      @JsonKey(name: "original_width") required int originalWidth,
      @JsonKey(name: "image_versions2") ImageVersions2? imageVersions2,
      @JsonKey(name: "carousel_media") List<CarouselMedia>? carouselMedia,
      @JsonKey(name: "cover_media") CoverMedia? coverMedia,
      @JsonKey(name: "video_versions")
      List<VideoVersion>? videosVersions}) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
