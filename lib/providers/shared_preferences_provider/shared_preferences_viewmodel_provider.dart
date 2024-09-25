import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/shared_preferences_repository/src/shared_preferences_viewmodel.dart';

final sharedPreferencesViewmodelProvider = Provider<SharedPreferencesViewmodel>(
    (ref) => SharedPreferencesViewmodel(ref: ref));
