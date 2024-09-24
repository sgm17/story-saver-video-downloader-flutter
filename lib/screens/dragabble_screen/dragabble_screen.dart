import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:story_saver_video_downloader/screens/dragabble_screen/widgets/draggable_widget.dart';

class DraggableScreen extends StatelessWidget {
  const DraggableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableMenu(
      expandable: true,
      fastDragClose: false,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      child: const DraggableWidget(),
    );
  }
}
