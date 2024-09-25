import 'package:story_saver_video_downloader/domains/permissions_repository/src/permissions_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsViewmodel implements PermissionsRepository {
  @override
  Future<bool> grantNotificationPermisisons() async {
    PermissionStatus status = await Permission.notification.request();
    return status.isGranted;
  }
}
