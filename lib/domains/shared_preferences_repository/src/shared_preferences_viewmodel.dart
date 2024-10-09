import 'package:story_saver_video_downloader/domains/shared_preferences_repository/src/shared_preferences_repository.dart';
import 'package:story_saver_video_downloader/domains/highlights_repository/src/models/models.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/models.dart';
import 'package:story_saver_video_downloader/domains/stories_repository/src/models/models.dart';
import 'package:story_saver_video_downloader/providers/shared_preferences_provider/providers.dart';
import 'package:story_saver_video_downloader/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

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

  @override
  Future storeDownloadedElements(
      Object type, List<Map<String, dynamic>> elementsToDownload) async {
    String? key;
    final preferneces = ref.read(sharedPreferencesProvider);

    switch (type) {
      case const (Post):
        key = Constants.PICTURES_HISTORY_KEY;
        final videos = elementsToDownload.where((e) => e["ext"] == "mp4");
        final jsonVideos = videos.map((e) => jsonEncode(e)).toList();
        await preferneces.setStringList(
            Constants.VIDEOS_HISTORY_KEY, jsonVideos);
        elementsToDownload = videos.where((e) => e["ext"] != "mp4").toList();
        break;
      case const (Story):
        key = Constants.STORIES_HISTORY_KEY;
        break;
      case const (Highlight):
        key = Constants.STORIES_HISTORY_KEY;
        break;
    }
    final jsonElementsToDownload =
        elementsToDownload.map((e) => jsonEncode(e)).toList();
    if (key != null) {
      await preferneces.setStringList(key, jsonElementsToDownload);
    }
  }

  @override
  List<Map<String, dynamic>> retrievePictures() {
    final preferneces = ref.read(sharedPreferencesProvider);
    final pictures = preferneces.getStringList(Constants.PICTURES_HISTORY_KEY);
    final mapPictures =
        pictures?.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    return mapPictures ?? [];
  }

  @override
  List<Map<String, dynamic>> retrieveStories() {
    final preferneces = ref.read(sharedPreferencesProvider);
    final stories = preferneces.getStringList(Constants.STORIES_HISTORY_KEY);
    final mapStories =
        stories?.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    return mapStories ?? [];
  }

  @override
  List<Map<String, dynamic>> retrieveVideos() {
    final preferneces = ref.read(sharedPreferencesProvider);
    final videos = preferneces.getStringList(Constants.VIDEOS_HISTORY_KEY);
    final mapVideos =
        videos?.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    return mapVideos ?? [];
  }
}
