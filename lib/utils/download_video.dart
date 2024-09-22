import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<void> downloadFileUsingHttp(String url) async {
  final headers = {
    "User-Agent":
        "Mozilla/5.0 (Linux; Android 10; Pixel 3 XL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Mobile Safari/537.36",
    "Referer": "https://www.instagram.com/",
  };
  var response = await http.get(Uri.parse("${url}_"), headers: headers);

  if (response.statusCode == 200) {
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
