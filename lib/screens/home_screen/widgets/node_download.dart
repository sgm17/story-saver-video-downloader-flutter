import 'package:story_saver_video_downloader/providers/code_provider.dart';
import 'package:story_saver_video_downloader/providers/nodes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';

class NodeDownload extends ConsumerWidget {
  const NodeDownload({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(nodesProvider);
    final code = ref.watch(codeProvider);

    // Corresponding images for the current code
    final carousel = nodes.where((element) => element.code == code).first;
    // Select the carousel images if they exist
    final media = carousel.carouselMedia;

    if (media == null) {
      // Is not a carousel, so select a single image
      return IgnorePointer(
        child: Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image.network(carousel.imageVersions[2].url),
          ),
        ),
      );
    }

    return Expanded(
      child: IgnorePointer(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: media.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 150,
                width: 150,
                child: Image.network(media[index].images[2].url),
              );
            }),
      ),
    );
  }
}
