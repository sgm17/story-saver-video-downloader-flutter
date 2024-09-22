import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/models/edge.dart';

final edgesProvider = StateProvider<List<Edge>>((ref) => []);
