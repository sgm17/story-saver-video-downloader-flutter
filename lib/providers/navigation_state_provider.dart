import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/models/navigation_state.dart';

final navigationStateProvider =
    StateProvider<NavigationState>((ref) => NavigationState.idle);
