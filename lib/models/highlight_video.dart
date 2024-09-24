class HighlightVideo {
  final int type;
  final String url;

  HighlightVideo({required this.type, required this.url});

  factory HighlightVideo.fromJson(Map<String, dynamic> json) {
    return HighlightVideo(url: json['url'], type: json['type']);
  }
}
