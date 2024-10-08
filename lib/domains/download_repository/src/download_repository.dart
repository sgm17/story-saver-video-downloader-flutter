abstract class DownloadRepository {
  Future<bool> downloadVideosFromUrl(
      {required List<Map<String, dynamic>> elementsToDownload,
      required String batchName,
      required void Function(
              {required double progress, required int currentDownload})
          updateProgress});
}
