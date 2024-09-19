import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/providers/ajax_stream_provider.dart';
import 'package:story_saver_video_downloader/providers/media_model.dart';
import 'package:story_saver_video_downloader/providers/media_notifier.dart';
import 'package:story_saver_video_downloader/providers/xhr_stream_provider.dart';

final mediaProvider = StateNotifierProvider<MediaNotifier, Media>((ref) {
  final Stream<String> xhrStream = ref.read(xhrStreamProvider).stream;
  final Stream<String> ajaxStream = ref.read(ajaxStreamProvider).stream;
  return MediaNotifier(ref, xhrStream, ajaxStream);
});
