import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';

Future<void> downloadVideoFromUrl(String url, Function callback) async {
  Dio dio = Dio();

  try {
    // Get the external storage directory (Downloads folder)
    Directory? downloadsDir = Directory('/storage/emulated/0/Download');

    if (!downloadsDir.existsSync()) {
      downloadsDir = await getExternalStorageDirectory();
    }

    String filePath =
        '${downloadsDir!.path}/${DateTime.now().millisecondsSinceEpoch}.mp4'; // Define file name

    // Start downloading the video
    await dio.download(url, filePath, onReceiveProgress: (received, total) {
      if (total != -1) {
        final progress = (received / total * 100).toStringAsFixed(0);
        callback(progress);
        print('Download progress: $progress%');
      }
    });

    print('Download complete: Video saved to $filePath');
  } catch (e) {
    print('Download failed: $e');
  }
}
