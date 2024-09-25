import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:story_saver_video_downloader/providers/download_provider/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class DownloadProgress extends ConsumerStatefulWidget {
  const DownloadProgress(
      {super.key,
      required this.elementsToDownload,
      required this.batchName,
      required this.dialogContext,
      required this.draggableContext});

  @override
  ConsumerState<DownloadProgress> createState() => _DownloadProgressState();

  final List<Map<String, dynamic>> elementsToDownload;
  final String batchName;
  final BuildContext dialogContext, draggableContext;
}

class _DownloadProgressState extends ConsumerState<DownloadProgress> {
  double _progress = 0.0;
  int _currentDownload = 0;

  @override
  void initState() {
    super.initState();
    initializeDownload();
  }

  void updateProgress(
      {required double progress, required int currentDownload}) {
    setState(() {
      _progress = progress;
      _currentDownload = currentDownload;
    });
  }

  // Simulating download progress
  void initializeDownload() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      final downloadResult = await ref
          .read(downloadViewmodelProvider)
          .downloadVideosFromUrl(
              elementsToDownload: widget.elementsToDownload,
              batchName: widget.batchName,
              updateProgress: updateProgress);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(widget.dialogContext).pop(downloadResult);
          Navigator.pop(widget.draggableContext);
        }
      });
    });
  }

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
              value: _progress / 100,
              strokeWidth: 10,
              backgroundColor:
                  Colors.grey[300], // Background color for the ring
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.blue), // Ring color
            ),
          ),
          // Percentage Text in the Center
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_progress.toStringAsFixed(0)}%', // Convert progress to percentage
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${_currentDownload + 1}/${widget.elementsToDownload.length}",
                style:
                    const TextStyle(fontSize: 14, color: AppColors.lightGrey),
              )
            ],
          ),
        ],
      ),
    );
  }
}
