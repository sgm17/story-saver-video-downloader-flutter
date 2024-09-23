import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/models/stories.dart';

final storiesProvider = StateProvider<List<Stories>>((ref) => []);
