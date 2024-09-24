import 'package:story_saver_video_downloader/models/carousel_media.dart';
import 'package:story_saver_video_downloader/models/image_versions2.dart';
import 'package:story_saver_video_downloader/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  const factory Node(
      {required String id,
      required User user,
      required List<ImageVersions2> imageVersions2,
      String? title,
      String? image,
      List<CarouselMedia>? carouselMedia}) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
