import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_saver_video_downloader/models/image_versions2.dart';
import 'package:story_saver_video_downloader/models/video_version.dart';
part 'carousel_media.freezed.dart';
part 'carousel_media.g.dart';

@freezed
class CarouselMedia with _$CarouselMedia {
  const factory CarouselMedia(
      {required String id,
      required int mediaType,
      required int originalHeight,
      required int originalWidth,
      required List<ImageVersions2> imageVersions2,
      List<VideoVersion>? videosVersions}) = _CarouselMedia;

  factory CarouselMedia.fromJson(Map<String, dynamic> json) =>
      _$CarouselMediaFromJson(json);
}
