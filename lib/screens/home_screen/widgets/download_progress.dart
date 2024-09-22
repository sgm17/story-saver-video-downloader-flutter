import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/utils/download_video.dart';

class DownloadProgress extends StatefulWidget {
  const DownloadProgress(
      {super.key, required this.url, required this.dialogContext});

  final String url;
  final BuildContext dialogContext;

  @override
  State<DownloadProgress> createState() => _DownloadProgressState();
}

class _DownloadProgressState extends State<DownloadProgress> {
  String downloadProgress = "0";

  @override
  void initState() {
    super.initState();
    initializeDownload();
  }

  void updateProgress(String progress) {
    setState(() {
      downloadProgress = progress;
    });
  }

  // Simulating download progress
  void initializeDownload() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      await downloadVideoFromUrl(widget.url, updateProgress);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (downloadProgress == "100") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(context).pop();
        }
      });
    }

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circular Progress Indicator (Ring)
          SizedBox(
            height: 150,
            width: 150,
            child: CircularProgressIndicator(
              value: int.parse(downloadProgress) /
                  100, // Value between 0.0 and 1.0
              strokeWidth: 10,
              backgroundColor:
                  Colors.grey[300], // Background color for the ring
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.blue), // Ring color
            ),
          ),
          // Percentage Text in the Center
          Text(
            '$downloadProgress%', // Convert progress to percentage
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
