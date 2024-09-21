class ImageCandidate {
  final String url;
  final int height;
  final int width;

  ImageCandidate({
    required this.url,
    required this.height,
    required this.width,
  });

  factory ImageCandidate.fromJson(Map<String, dynamic> json) {
    return ImageCandidate(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }
}
