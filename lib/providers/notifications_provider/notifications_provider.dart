import 'package:story_saver_video_downloader/providers/notifications_provider/notifications_notifier.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationsProvider = StateNotifierProvider<NotificationsNotifier,
    FlutterLocalNotificationsPlugin>((ref) => NotificationsNotifier(ref));
