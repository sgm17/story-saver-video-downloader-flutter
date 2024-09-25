abstract class SharedPreferencesRepository {
  Future setDownloadLocation({required String downloadLocation});
  String getDownloadLocation();
}
