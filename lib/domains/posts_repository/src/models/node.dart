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
      required List<ImageVersions2> imageVersions2,
      String? title,
      String? image,
      List<CarouselMedia>? carouselMedia}) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
