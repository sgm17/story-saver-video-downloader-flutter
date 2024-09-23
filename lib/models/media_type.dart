enum MediaType { picture, video, story }

extension MediaTypeExtension on MediaType {
  String get name {
    switch (this) {
      case MediaType.picture:
        return 'Picture';
      case MediaType.video:
        return 'Video';
      case MediaType.story:
        return 'Story';
    }
  }
}
