import 'package:story_saver_video_downloader/models/user.dart';

class HighlightNode {
  final String id;
  final User user;
  final String title;
  final String image;

  HighlightNode(
      {required this.id,
      required this.user,
      required this.title,
      required this.image});

  factory HighlightNode.fromJson(Map<String, dynamic> json) {
    return HighlightNode(
        id: json['id'],
        user: User.fromJson(json['user']),
        title: json['title'],
        image: json['cover_media']['cropped_image_version']['url']);
  }
}
