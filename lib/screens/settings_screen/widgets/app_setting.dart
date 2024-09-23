import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  late FlutterLocalNotificationsPlugin state;
  @override
  void initState() {
    super.initState();
    state = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);
    state.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        PermissionStatus status = await Permission.notification.request();
        if (status.isGranted) {
          // notification permission is granted
          await showNotification(state);
        } else {
          // Open settings to enable notification permission
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Row(
          children: [
            Icon(widget.icon, size: 21),
            SizedBox(
              width: 16,
            ),
            Text(widget.title,
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // Function to show the notification
  Future<void> showNotification(state) async {
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
