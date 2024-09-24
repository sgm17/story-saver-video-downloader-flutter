import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/stories_repository/src/models/story.dart';

final storiesProvider = StateProvider<List<Stories>>((ref) => []);
