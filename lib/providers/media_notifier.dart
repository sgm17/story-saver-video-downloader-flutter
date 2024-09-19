import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/providers/media_model.dart';
import 'dart:async';

class MediaNotifier extends StateNotifier<Media> {
  final Ref ref;
  final Stream<String> xhrStream;
  final Stream<String> ajaxStream;
  StreamSubscription<String>? xhrSubscription;
  StreamSubscription<String>? ajaxSubscription;

  MediaNotifier(this.ref, this.xhrStream, this.ajaxStream)
      : super(Media.emptyMedia()) {
    initialize();
  }

  void initialize() {
    xhrSubscription = xhrStream.listen((event) {
      state = Media(videos: [...state.videos, event], images: state.images);
    });

    ajaxSubscription = ajaxStream.listen((event) {
      state = Media(images: [...state.images, event], videos: state.videos);
    });
  }

  void clean() {
    state = Media(images: [], videos: []);
  }
}
