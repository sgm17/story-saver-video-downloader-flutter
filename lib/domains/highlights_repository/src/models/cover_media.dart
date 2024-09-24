import 'package:freezed_annotation/freezed_annotation.dart';
import 'models.dart';
part 'cover_media.freezed.dart';
part 'cover_media.g.dart';

@freezed
class CoverMedia with _$CoverMedia {
  const factory CoverMedia(
      {@JsonKey(name: "cropped_image_version")
      required CroppedImageVersion croppedImageVersion}) = _CoverMedia;

  factory CoverMedia.fromJson(Map<String, dynamic> json) =>
      _$CoverMediaFromJson(json);
}
