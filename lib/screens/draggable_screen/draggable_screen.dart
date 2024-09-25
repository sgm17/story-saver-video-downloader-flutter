import 'package:story_saver_video_downloader/screens/draggable_screen/widgets/draggable_widget.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class DraggableScreen extends StatelessWidget {
  const DraggableScreen({super.key, required this.type, required this.index});

  final Object type;
  final int index;

  @override
  Widget build(BuildContext context) {
    return DraggableMenu(
      expandable: true,
      fastDragClose: false,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      child: DraggableWidget(type: type, index: index),
    );
  }
}
