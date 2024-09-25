import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationsRepository {
  FlutterLocalNotificationsPlugin initializeNotifications();
  Future showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin);
}
