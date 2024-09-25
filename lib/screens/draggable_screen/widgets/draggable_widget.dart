import 'package:story_saver_video_downloader/domains/highlights_repository/src/models/models.dart';
import 'package:story_saver_video_downloader/domains/posts_repository/src/models/models.dart';
import 'package:story_saver_video_downloader/domains/stories_repository/src/models/models.dart';
import 'package:story_saver_video_downloader/providers/download_provider/download_viewmodel_provider.dart';
import 'package:story_saver_video_downloader/providers/highlights_provider/highlights_provider.dart';
import 'package:story_saver_video_downloader/screens/draggable_screen/widgets/draggable_item.dart';
import 'package:story_saver_video_downloader/providers/posts_provider/providers.dart';
import 'package:story_saver_video_downloader/providers/stories_provider/providers.dart';
import 'package:story_saver_video_downloader/providers/username_provider.dart';
import 'package:story_saver_video_downloader/screens/draggable_screen/widgets/draggable_header.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class DraggableWidget extends ConsumerStatefulWidget {
  const DraggableWidget({super.key, required this.type, required this.index});

  final Object type;
  final int index;

  @override
  ConsumerState<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends ConsumerState<DraggableWidget> {
  late List<String> selectedIdNodes;
  late List<Node> edge;
  late String batchName;

  void onTapDraggableItem({required String id}) {
    setState(() {
      if (selectedIdNodes.contains(id)) {
        selectedIdNodes = selectedIdNodes.where((e) => e != id).toList();
      } else {
        selectedIdNodes = [id, ...selectedIdNodes];
      }
    });
  }

  @override
  void initState() {
    super.initState();

    final username = ref.read(usernameProvider);
    edge = getEdgesFromObject(ref, widget.type, username) ?? [];
    selectedIdNodes = edge.map((e) => e.id).toList();
    batchName = "${username}_${DateTime.now().millisecondsSinceEpoch}";
  }

  @override
  Widget build(BuildContext context) {
    if (edge.isEmpty) {
      return const SizedBox.shrink();
    }

    final numberElements = edge.length;

    final totalHeight = MediaQuery.of(context).size.height;
    final listViewHeight = numberElements * (60 + 12) > totalHeight / 2
        ? totalHeight / 2
        : (numberElements * (60 + 12).toDouble());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DraggableHeader(
            firstImage: edge.first.imageVersions2!.candidates.first.url,
            batchName: batchName,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: AppColors.lightGrey, thickness: 1),
          ),
          const Text("BATCH", style: TextStyle(color: AppColors.darkGrey)),
          const SizedBox(height: 10),
          SizedBox(
            height: listViewHeight,
            child: ListView.separated(
              itemCount: numberElements,
              itemBuilder: (context, index) {
                final node = edge[index];
                return DraggableItem(
                    filename: "${index}_$batchName",
                    node: node,
                    selectIdNodes: selectedIdNodes,
                    onTapDraggableItem: onTapDraggableItem);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: handleDownloadTap,
            child: Container(
              alignment: Alignment.center,
              height: 55,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Download ${selectedIdNodes.length} items",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
          const SizedBox(height: 23),
        ],
      ),
    );
  }

  List<Node>? getEdgesFromObject(WidgetRef ref, Object type, String? username) {
    List<Node>? edge;

    switch (type) {
      case const (Post):
        final posts = ref.read(postsProvider);
        edge = posts
            .where((e) => e.username == username)
            .firstOrNull
            ?.edges[widget.index]
            .carouselMedia;
        break;
      case const (Story):
        final stories = ref.read(storiesProvider);
        edge = stories.where((e) => e.username == username).firstOrNull?.edges;
        break;
      case const (Highlight):
        final highlights = ref.read(highlightsProvider);
        edge =
            highlights.where((e) => e.username == username).firstOrNull?.edges;
        break;
    }

    return edge;
  }

  void updateProgress(
      {required double progress, required int currentDownload}) {
    print("This: $progress, $currentDownload/${selectedIdNodes.length}");
  }

  Future handleDownloadTap() async {
    final filteredEdges =
        edge.where((e) => selectedIdNodes.contains(e.id)).toList();
    List<Map<String, dynamic>> urlsToDownload = [];

    switch (widget.type) {
      case const (Post):
        for (Node e in filteredEdges) {
          if (e.mediaType == 2) {
            urlsToDownload
                .add({"url": e.videosVersions!.first.url, "ext": "mp4"});
          } else {
            urlsToDownload.add(
                {"url": e.imageVersions2!.candidates.first.url, "ext": "jpg"});
          }
        }
        break;
    }

    if (urlsToDownload.isNotEmpty) {
      await ref.read(downloadViewmodelProvider).downloadVideosFromUrl(
          elementsToDownload: urlsToDownload,
          batchName: batchName,
          updateProgress: updateProgress);
    }
  }
}
