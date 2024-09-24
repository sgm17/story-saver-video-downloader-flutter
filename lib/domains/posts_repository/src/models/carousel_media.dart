import 'package:freezed_annotation/freezed_annotation.dart';
import 'models.dart';
part 'carousel_media.freezed.dart';
part 'carousel_media.g.dart';

@freezed
class CarouselMedia with _$CarouselMedia {
  const factory CarouselMedia(
      {required String id,
      @JsonKey(name: "media_type") required int mediaType,
      @JsonKey(name: "original_height") required int originalHeight,
      @JsonKey(name: "original_width") required int originalWidth,
      @JsonKey(name: "image_versions2") required ImageVersions2 imageVersions2,
      @JsonKey(name: "video_versions")
      List<VideoVersion>? videosVersions}) = _CarouselMedia;

  factory CarouselMedia.fromJson(Map<String, dynamic> json) =>
      _$CarouselMediaFromJson(json);
}
