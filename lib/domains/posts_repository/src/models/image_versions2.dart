import 'package:freezed_annotation/freezed_annotation.dart';
import 'models.dart';
part 'image_versions2.freezed.dart';
part 'image_versions2.g.dart';

@freezed
class ImageVersions2 with _$ImageVersions2 {
  const factory ImageVersions2({required List<Candidate> candidates}) =
      _ImageVersions2;

  factory ImageVersions2.fromJson(Map<String, dynamic> json) =>
      _$ImageVersions2FromJson(json);
}
