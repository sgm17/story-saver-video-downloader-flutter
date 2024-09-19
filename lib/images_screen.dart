import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/providers/media_provider.dart';

class ImagesScreen extends ConsumerWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = ref.watch(mediaProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: media.images.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100,
            child: Image.network(media.images[index]),
          );
        },
      ),
    );
  }
}
