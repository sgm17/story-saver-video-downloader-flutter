import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/providers/initial_y_position_provider.dart';
import 'package:story_saver_video_downloader/providers/scroll_y_provider.dart';

final overflowedRowsProvider =
    StateProvider.family<int, dynamic>((ref, postSize) {
  final scrollY = ref.watch(scrollYProvider);
  final initialYPosition = ref.watch(initialYPositionProvider);

  if (initialYPosition != 0.0) {
    // Prevent infinite division
    final difference = scrollY - initialYPosition;

    if (difference < 0) {
      return 0; // No overflow
    } else {
      // Calculate effective size of each item including padding
      final effectivePostSize = postSize + 2;

      // Calculate the number of overflowed rows
      final overflowedRows = (difference ~/ effectivePostSize);
      return overflowedRows + 1; // Return the number of overflowed rows
    }
  }

  return 0; // Default case if initialYPosition is 0
});
