import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/providers/notifications_provider/providers.dart';

final notificationsProvider = StateProvider<FlutterLocalNotificationsPlugin>(
    (ref) =>
        ref.read(notificationsViewmodelProvider).initializeNotifications());
