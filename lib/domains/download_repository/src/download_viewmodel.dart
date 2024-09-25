import 'package:story_saver_video_downloader/domains/download_repository/src/download_repository.dart';
import 'package:story_saver_video_downloader/providers/shared_preferences_provider/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class DownloadViewmodel implements DownloadRepository {
  final Ref ref;

  DownloadViewmodel({required this.ref});

  @override
  Future<bool> downloadVideosFromUrl(
      {required List<Map<String, dynamic>> elementsToDownload,
      required String batchName,
      required void Function(
              {required double progress, required int currentDownload})
          updateProgress}) async {
    final dio = Dio();
    int _currentDownload = 0;

    Future downloadFile({required String url, required String filePath}) async {
      // Start downloading the video
      await dio.download(url, filePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          final progress = (received / total * 100);
          updateProgress(progress: progress, currentDownload: _currentDownload);
        }
      });
      _currentDownload += 1;
    }

    try {
      // Get the external storage directory (Downloads folder)
      final downloadsDirString =
          ref.read(sharedPreferencesViewmodelProvider).getDownloadLocation();
      Directory? downloadsDir = Directory(downloadsDirString);

      if (!downloadsDir.existsSync()) {
        downloadsDir = await getExternalStorageDirectory();
      }

      Directory batchDir = Directory("${downloadsDir!.path}/$batchName");

      if (!downloadsDir.existsSync()) {
        await batchDir.create();
      }

      List<Future> downloadTasks = [];

      for (Map<String, dynamic> el in elementsToDownload) {
        int index = elementsToDownload.indexOf(el);
        String filePath = "${batchDir.path}/$index.${el["ext"]}";

        downloadTasks.add(downloadFile(url: el["url"], filePath: filePath));
      }

      await Future.wait(downloadTasks);
      return true;
    } catch (e) {
      print("Error $e");
      return false;
    }
  }
}
