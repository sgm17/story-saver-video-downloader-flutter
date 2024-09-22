import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

Future<void> downloadFileUsingHttp(String url) async {
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 206) {
    Directory? downloadsDirectory = await getExternalStorageDirectory();
    String filePath = '${downloadsDirectory!.path}/downloaded_video.mp4';

    // Write the response body to a file
    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    print('Download complete: Video saved to $filePath');
  } else {
    print('Download failed: ${response.statusCode}');
  }
}

Future<void> downloadVideoFromUrl(String url) async {
// Check for storage permissions
  // var status = await Permission.storage.status;
  // if (!status.isGranted) {
  //   print('Storage permission not granted. Requesting permission...');
  //   status = await Permission.storage.request();

  //   if (!status.isGranted) {
  //     print('Storage permission denied. Cannot download the video.');
  //     return;
  //   }
  // }

  // Create Dio instance for downloading the file
  Dio dio = Dio();

  try {
    // Get the app's documents directory for saving the file
    Directory? downloadsDirectory = await getExternalStorageDirectory();
    String filePath =
        '${downloadsDirectory!.path}/downloaded_video.mp4'; // Define file name

    // Start downloading the video
    await dio.download(url, filePath,
        options: Options(headers: {
          "User-Agent": "PostmanRuntime/7.42.0",
          "sec-ch-ua":
              "\"Chromium\";v=\"128\", \"Not;A=Brand\";v=\"24\", \"Google Chrome\";v=\"128\"",
          "sec-ch-ua-mobile": "?0",
          "sec-ch-ua-platform": "\"macOS\"",
          "Referer": "https://www.instagram.com/",
        }), onReceiveProgress: (received, total) {
      if (total != -1) {
        print(
            'Download progress: ${(received / total * 100).toStringAsFixed(0)}%');
      }
    });

    print('Download complete: Video saved to $filePath');
  } catch (e) {
    print('Download failed: $e');
  }
}

Future<bool> requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
  }
  return false;
}
