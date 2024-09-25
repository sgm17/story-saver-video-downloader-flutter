abstract class DownloadRepository {
  Future downloadVideosFromUrl(
      {required List<String> urls,
      required String batchName,
      required void Function({required String progress}) updateProgress});
}
