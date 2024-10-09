abstract class SharedPreferencesRepository {
  Future setDownloadLocation({required String downloadLocation});
  String getDownloadLocation();
  Future storeDownloadedElements(
      Object type, List<Map<String, dynamic>> elementsToDownload);
  List<Map<String, dynamic>> retrievePictures();
  List<Map<String, dynamic>> retrieveVideos();
  List<Map<String, dynamic>> retrieveStories();
}
