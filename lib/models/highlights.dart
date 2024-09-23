import 'package:story_saver_video_downloader/models/highlight_node.dart';

class Highlights {
  final String username;
  final List<HighlightNode> node;

  Highlights({required this.username, required this.node});

  Highlights copyWith({List<HighlightNode>? newNode}) {
    return Highlights(
      username: username,
      node: newNode ?? node,
    );
  }
}
