import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/constants/constants.dart';
import 'package:story_saver_video_downloader/domains/download_repository/src/download_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class DownloadViewmodel implements DownloadRepository {
  final Ref ref;

  DownloadViewmodel({required this.ref});

  @override
  Future downloadVideosFromUrl(
      {required List<String> urls,
      required String batchName,
      required void Function({required String progress})
          updateProgress}) async {
    final dio = Dio();

    Future downloadFile({required String url, required String filePath}) async {
      // Start downloading the video
      await dio.download(url, filePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          final progress =
              ((received / urls.length) / total * 100).toStringAsFixed(0);
          updateProgress(progress: progress);
        }
      });

      print('Download complete: Video saved to $filePath');
    }

    try {
      // Get the external storage directory (Downloads folder)
      Directory? downloadsDir = Directory(Constants.DEFAULT_DOWNLOAD_LOCATION);

      if (!downloadsDir.existsSync()) {
        downloadsDir = await getExternalStorageDirectory();
      }

      List<Future> downloadTasks = [];

      for (String url in urls) {
        int index = urls.indexOf(url);
        String fileName = "${index}_$batchName";
        String filePath = "${downloadsDir!.path}/$fileName";

        downloadTasks.add(downloadFile(url: url, filePath: filePath));
      }

      await Future.wait(downloadTasks);
    } catch (e) {
      print("Error $e");
    }
  }
}
