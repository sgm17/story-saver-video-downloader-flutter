import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/domains/permissions_repository/permissions_repository.dart';

final permissionsViewmodelProvider =
    Provider<PermissionsViewmodel>((ref) => PermissionsViewmodel());
