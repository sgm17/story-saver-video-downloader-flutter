import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/download_repository/src/download_viewmodel.dart';

final downloadViewmodelProvider =
    Provider<DownloadViewmodel>((ref) => DownloadViewmodel(ref: ref));
