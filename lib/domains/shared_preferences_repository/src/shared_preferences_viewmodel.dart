import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/constants/constants.dart';
import 'package:story_saver_video_downloader/domains/shared_preferences_repository/src/shared_preferences_repository.dart';
import 'package:story_saver_video_downloader/providers/shared_preferences_provider/providers.dart';

class SharedPreferencesViewmodel implements SharedPreferencesRepository {
  final Ref ref;

  SharedPreferencesViewmodel({required this.ref});

  @override
  Future setDownloadLocation({required String downloadLocation}) async {
    final preferences = ref.read(sharedPreferencesProvider);
    await preferences.setString(
        Constants.DOWNLOAD_LOCATION_KEY, downloadLocation);
  }

  @override
  String getDownloadLocation() {
    final preferences = ref.read(sharedPreferencesProvider);
    return preferences.getString(Constants.DOWNLOAD_LOCATION_KEY) ??
        Constants.DEFAULT_DOWNLOAD_LOCATION;
  }
}
