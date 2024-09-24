import 'package:freezed_annotation/freezed_annotation.dart';
part 'video_version.freezed.dart';
part 'video_version.g.dart';

@freezed
class VideoVersion with _$VideoVersion {
  const factory VideoVersion({int? width, int? height, required String url}) =
      _VideoVersion;

  factory VideoVersion.fromJson(Map<String, dynamic> json) =>
      _$VideoVersionFromJson(json);
}
