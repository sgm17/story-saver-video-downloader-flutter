import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:story_saver_video_downloader/screens/settings_screen/widgets/location_input.dart';

class DownloadLocationSetting extends StatelessWidget {
  const DownloadLocationSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var downloadLocation = "/storage/emulated/0/DCIM/Save Insta/";

    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return LocationInput();
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Row(
          children: [
            Icon(Icons.upload_file, size: 21),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Download Location",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Text(downloadLocation,
                    style: TextStyle(fontSize: 12, color: AppColors.darkGrey)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
