import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/models/navigation_state.dart';
import 'package:story_saver_video_downloader/providers/code_provider.dart';
import 'package:story_saver_video_downloader/providers/edges_provider.dart';
import 'package:story_saver_video_downloader/providers/img_index_provider.dart';
import 'package:story_saver_video_downloader/providers/navigation_state_provider.dart';
import 'package:story_saver_video_downloader/providers/username_provider.dart';

void updateNavigationState(WidgetRef ref, String url) {
  if (url == "https://www.instagram.com/") {
    // Set the navigation state to the initial state
    ref.read(navigationStateProvider.notifier).state = NavigationState.idle;
    return;
  }

  /// TRY TO EXTRACT THE CODE FROM THE URL
  // Check the current url
  final regExpHistoryCode = RegExp(r'\/p\/([^\/]+)');

  // Use the regex to find matches
  final historyCodeMatch = regExpHistoryCode.firstMatch(url);
  final code = historyCodeMatch?.group(1);

  /// TRY TO EXTRACT THE USERNAME FROM THE URL
  // Define the regex pattern
  final RegExp regExp =
      RegExp(r'https:\/\/www\.instagram\.com\/([a-zA-Z0-9._]+)\/');

  // Use the regex to find matches
  final match = regExp.firstMatch(url);
  final username = match?.group(1);

  if (username != null && username != "p") {
    // Update the username and notify others
    ref.read(usernameProvider.notifier).state = username;
    // Update the navigation state
    ref.read(navigationStateProvider.notifier).state = NavigationState.profile;
  }

  if (code != null) {
    final edges = ref.read(edgesProvider);
    final username = ref.read(usernameProvider);
    final nodes = edges.where((e) => e.username == username).firstOrNull;

    if (nodes != null) {
      final codeExists = nodes.nodes.any((e) => e.code == code);

      if (codeExists) {
        // Set the code of the node
        ref.read(codeProvider.notifier).state = code;

        // Set the code navigation state
        ref.read(navigationStateProvider.notifier).state = NavigationState.post;
      }
    }
  }

  // Parse the URL
  Uri uri = Uri.parse(url);

  // Extract the 'img_index' query parameter
  String? imgIndex = uri.queryParameters['img_index'];

  // Check if the 'img_index' parameter exists and print it
  if (imgIndex != null) {
    ref.read(imgIndexProvider.notifier).state = int.parse(imgIndex) - 1;
  } else {
    ref.read(imgIndexProvider.notifier).state = 0;
  }
}
