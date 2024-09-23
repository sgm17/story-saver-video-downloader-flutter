import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/app_colors.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  late TextEditingController _textFieldController;

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController();
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
            const InputDecoration(hintText: "/storage/emulated/0/Download/"),
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
          onPressed: () {
            print(_textFieldController.text);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
