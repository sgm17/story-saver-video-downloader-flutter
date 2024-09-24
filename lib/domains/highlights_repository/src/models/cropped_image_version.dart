import 'package:freezed_annotation/freezed_annotation.dart';
part 'cropped_image_version.freezed.dart';
part 'cropped_image_version.g.dart';

@freezed
class CroppedImageVersion with _$CroppedImageVersion {
  const factory CroppedImageVersion({required String url}) =
      _CroppedImageVersion;

  factory CroppedImageVersion.fromJson(Map<String, dynamic> json) =>
      _$CroppedImageVersionFromJson(json);
}
