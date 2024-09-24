import 'package:story_saver_video_downloader/models/highlight_video.dart';
import 'package:story_saver_video_downloader/models/image_candidate.dart';

class HighlightCarousel {
  final String id;
  final int mediaType;
  final int originalHeight;
  final int originalWidth;
  final List<ImageCandidate> images;
  final List<HighlightVideo>? videos;

  HighlightCarousel(
      {required this.id,
      required this.originalHeight,
      required this.originalWidth,
      this.mediaType = 1,
      required this.images,
      this.videos});

  factory HighlightCarousel.fromJson(Map<String, dynamic> json) {
    return HighlightCarousel(
        id: json['id'],
        mediaType: json['media_type'],
        images: (json['image_versions2']['candidates'] as List)
            .map((e) => ImageCandidate.fromJson(e))
            .toList(),
        videos: (json['video_versions'] as List?)
            ?.map((e) => HighlightVideo.fromJson(e))
            .toList(),
        originalHeight: json['original_height'],
        originalWidth: json['original_width']);
  }
}
