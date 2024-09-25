import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/utils/download_video.dart';

class DownloadProgress extends StatelessWidget {
  const DownloadProgress({super.key});

  @override
  Widget build(BuildContext context) {
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
