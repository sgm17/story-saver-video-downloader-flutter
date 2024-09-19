class Media {
  final List<String> images;
  final List<String> videos;

  Media({required this.images, required this.videos});

  static emptyMedia() => Media(images: [], videos: []);
}
