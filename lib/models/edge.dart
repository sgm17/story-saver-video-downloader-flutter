import 'package:story_saver_video_downloader/models/node.dart';

class Edge {
  final String username;
  final List<Node> nodes;

  Edge({required this.username, required this.nodes});

  // Implement copyWith for immutability
  Edge copyWith({List<Node>? nodes}) {
    return Edge(
      username: username, // Keep username the same
      nodes:
          nodes ?? this.nodes, // Update nodes if provided, else keep the same
    );
  }
}
