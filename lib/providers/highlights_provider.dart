import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/models/highlights.dart';
import 'package:story_saver_video_downloader/models/node.dart';

final highlightsProvider = StateProvider<List<Highlights>>((ref) => []);
