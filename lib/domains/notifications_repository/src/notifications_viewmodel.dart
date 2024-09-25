import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/notifications_repository/src/notifications_repository.dart';
import 'package:story_saver_video_downloader/providers/notifications_provider/notifications_provider.dart';
import 'package:story_saver_video_downloader/providers/permissions_provider/permissions_viewmodel_provider.dart';

class NotificationsViewmodel implements NotificationsRepository {
  final Ref ref;

  NotificationsViewmodel({required this.ref});

  @override
  FlutterLocalNotificationsPlugin initializeNotifications() {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    return flutterLocalNotificationsPlugin;
  }

  @override
  Future showNotification({required String title, required String body}) async {
    if (await ref
        .read(permissionsViewmodelProvider)
        .grantNotificationPermisisons()) {
      final flutterLocalNotificationsPlugin = ref.read(notificationsProvider);
      const AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails('your channel id', 'your channel name',
              channelDescription: 'your channel description',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker');
      const NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin
          .show(0, title, body, notificationDetails, payload: 'item x');
    }
  }
}
