import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/notifications_repository/src/notifications_viewmodel.dart';

final notificationsViewmodelProvider =
    Provider<NotificationsViewmodel>((ref) => NotificationsViewmodel(ref: ref));
