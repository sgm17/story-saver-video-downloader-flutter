import 'package:story_saver_video_downloader/providers/shared_preferences_provider/shared_preferences_viewmodel_provider.dart';
import 'package:story_saver_video_downloader/constants/constants.dart';
import 'package:story_saver_video_downloader/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class LocationInput extends ConsumerStatefulWidget {
  const LocationInput({super.key});

  @override
  ConsumerState<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends ConsumerState<LocationInput> {
  late TextEditingController _textFieldController;

  @override
  void initState() {
    super.initState();
    final downloadLocation =
        ref.read(sharedPreferencesViewmodelProvider).getDownloadLocation();
    _textFieldController = TextEditingController(text: downloadLocation);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Modify the Download Location',
        maxLines: 1,
        style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis),
      ),
      content: TextField(
        controller: _textFieldController,
        decoration:
            InputDecoration(hintText: Constants.DEFAULT_DOWNLOAD_LOCATION),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Confirm'),
          onPressed: () async {
            if (!mounted) return;
            await updateDownloadLocation();
            if (mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }

  Future updateDownloadLocation() async {
    ref
        .read(sharedPreferencesViewmodelProvider)
        .setDownloadLocation(downloadLocation: _textFieldController.text);
  }
}
