import 'package:freezed_annotation/freezed_annotation.dart';
import 'models.dart';
part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  const factory Node(
      {required String id,
      String? code,
      required User user,
      @JsonKey(name: "image_versions2") required ImageVersions2 imageVersions2,
      String? title,
      String? image,
      @JsonKey(name: "carousel_media")
      List<CarouselMedia>? carouselMedia}) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
