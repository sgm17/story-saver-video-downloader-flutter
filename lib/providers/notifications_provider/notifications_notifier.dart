import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationsNotifier
    extends StateNotifier<FlutterLocalNotificationsPlugin> {
  final Ref ref;

  NotificationsNotifier(this.ref) : super(FlutterLocalNotificationsPlugin()) {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);
    state.initialize(initializationSettings);
  }

  // Function to show the notification
  Future<void> showNotification(state) async {
    if (await _grantPermission()) {
      const AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails('your channel id', 'your channel name',
              channelDescription: 'your channel description',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker');
      const NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await state.show(0, 'plain title', 'plain body', notificationDetails,
          payload: 'item x');
    }
  }

  Future<bool> _grantPermission() async {
    PermissionStatus status = await Permission.notification.request();
    return status.isGranted;
  }
}
