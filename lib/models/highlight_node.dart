import 'package:story_saver_video_downloader/models/user.dart';

class HighlightNode {
  final String id;
  final User user;
  final String title;

  HighlightNode({required this.id, required this.user, required this.title});

  factory HighlightNode.fromJson(Map<String, dynamic> json) {
    return HighlightNode(
      id: json['id'],
      user: User.fromJson(json['user']),
      title: json['title'],
    );
  }
}
