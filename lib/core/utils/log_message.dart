import 'dart:developer';

import 'package:stack_trace/stack_trace.dart';

void logMessage(String message) {
  final currentTrace = Trace.current();
  final frame = currentTrace.frames[1];

  log('${frame},\n'
      '$message');
}
