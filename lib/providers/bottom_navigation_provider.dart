import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider = StateProvider<String>((ref) {
  return "home";
});
