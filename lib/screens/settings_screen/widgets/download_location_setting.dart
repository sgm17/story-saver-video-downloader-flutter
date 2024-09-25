import 'package:story_saver_video_downloader/providers/shared_preferences_provider/shared_preferences_viewmodel_provider.dart';
import 'package:story_saver_video_downloader/dialogs/location_input.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class DownloadLocationSetting extends ConsumerWidget {
  const DownloadLocationSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadLocation =
        ref.read(sharedPreferencesViewmodelProvider).getDownloadLocation();
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const LocationInput();
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Row(
          children: [
            const Icon(Icons.upload_file, size: 21),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Download Location",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(downloadLocation,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.darkGrey)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
