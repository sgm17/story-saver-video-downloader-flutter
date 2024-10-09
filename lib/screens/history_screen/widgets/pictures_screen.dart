import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/providers/history_provider/pictures_provider.dart';
import 'package:story_saver_video_downloader/screens/history_screen/widgets/picture_item.dart';

class PicturesScreen extends ConsumerWidget {
  const PicturesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictures = ref.watch(picturesProvider);

    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemBuilder: (context, index) {
          final picture = pictures[index];
          final filename =
              "${picture["index"]}_${picture["batchName"]}_${picture["ext"]}";
          return PictureItem(
            image: picture["url"],
            filename: filename,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemCount: 22);
  }
}
