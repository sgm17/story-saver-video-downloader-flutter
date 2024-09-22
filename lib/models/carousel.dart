// Carousel Media
import 'package:story_saver_video_downloader/models/image_candidate.dart';

class CarouselMedia {
  final String id;
  final int originalHeight;
  final int originalWidth;
  final int mediaType;
  final List<ImageCandidate> images;

  CarouselMedia({
    required this.id,
    required this.originalHeight,
    required this.originalWidth,
    required this.mediaType,
    required this.images,
  });

  factory CarouselMedia.fromJson(Map<String, dynamic> json) {
    return CarouselMedia(
      id: json['id'],
      originalHeight: json['original_height'],
      originalWidth: json['original_width'],
      mediaType: json['media_type'],
      images: (json['image_versions2']['candidates'] as List)
          .map((e) => ImageCandidate.fromJson(e))
          .toList(),
    );
  }
}
