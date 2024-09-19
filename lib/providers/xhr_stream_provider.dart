import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final xhrStreamProvider = Provider<StreamController<String>>(
    (ref) => StreamController<String>.broadcast());
