import 'package:story_saver_video_downloader/models/image_candidate.dart';
import 'package:story_saver_video_downloader/models/carousel.dart';
import 'package:story_saver_video_downloader/models/owner.dart';
import 'package:story_saver_video_downloader/models/user.dart';

class Node {
  final String code;
  final String pk;
  final String id;
  final int takenAt;
  final List<ImageCandidate> imageVersions;
  final User user;
  final Owner owner;
  final int likeCount;
  final int commentCount;
  final List<CarouselMedia>? carouselMedia;

  Node({
    required this.code,
    required this.pk,
    required this.id,
    required this.takenAt,
    required this.imageVersions,
    required this.user,
    required this.owner,
    required this.likeCount,
    required this.commentCount,
    required this.carouselMedia,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
        code: json['code'],
        pk: json['pk'],
        id: json['id'],
        takenAt: json['taken_at'],
        imageVersions: (json['image_versions2']['candidates'] as List)
            .map((e) => ImageCandidate.fromJson(e))
            .toList(),
        user: User.fromJson(json['user']),
        owner: Owner.fromJson(json['owner']),
        likeCount: json['like_count'],
        commentCount: json['comment_count'],
        carouselMedia: (json['carousel_media'] as List?)
            ?.map((e) => CarouselMedia.fromJson(e))
            .toList());
  }
}
