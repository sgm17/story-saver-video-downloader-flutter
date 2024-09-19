import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final ajaxStreamProvider = Provider<StreamController<String>>(
    (ref) => StreamController<String>.broadcast());
