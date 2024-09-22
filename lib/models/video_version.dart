class VideoVersion {
  final int width;
  final int height;
  final String url;

  VideoVersion({required this.width, required this.height, required this.url});

  factory VideoVersion.fromJson(Map<String, dynamic> json) {
    return VideoVersion(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }
}
