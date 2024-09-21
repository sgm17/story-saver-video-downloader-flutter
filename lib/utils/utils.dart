import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_saver_video_downloader/models/navigation_state.dart';
import 'package:story_saver_video_downloader/providers/code_provider.dart';
import 'package:story_saver_video_downloader/providers/navigation_state_provider.dart';
import 'package:story_saver_video_downloader/providers/nodes_provider.dart';

void updateNavigationState(WidgetRef ref, String url) {
  if (url == "https://www.instagram.com/") {
    // Set the navigation state to the initial state
    ref.read(navigationStateProvider.notifier).state = NavigationState.idle;
    return;
  }

  final nodes = ref.read(nodesProvider);

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

  if (username != null) {
    // Updaete the navigation state
    ref.read(navigationStateProvider.notifier).state = NavigationState.profile;

    // Get the username from the nodes
    final newUsername = nodes.first.user.username;

    // Compare the username
    if (username != newUsername) {
      // Initialize the array if the usernames doesn't match
      ref.read(nodesProvider.notifier).state = [];
    }
  }

  if (code != null) {
    final carousel = nodes.any((element) => element.code == code);

    if (carousel) {
      // Set the code of the node
      ref.read(codeProvider.notifier).state = code;

      // Set the code navigation state
      ref.read(navigationStateProvider.notifier).state = NavigationState.post;
    }
  }
}
