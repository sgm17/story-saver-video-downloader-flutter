import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/posts_repository.dart';
part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story(
      {required String username, required List<CarouselMedia> media}) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
