import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CustomLogger extends Logger {
  CustomLogger() : super(printer: PrettyPrinter());

  void logLong(String message) {
    final pattern = RegExp('.{1,800}');
    for (final match in pattern.allMatches(message)) {
      d(match.group(0));
    }
  }
}

mixin AppLogger {
  final _logger = CustomLogger();

  void printDebugLog(String message) {
    _logger.d('message: $message');
  }

  void printErrorLog(String message) {
    _logger.e('message: $message');
  }

  void printInfoLog(String message) {
    _logger.i('message: $message');
  }

  void printWarningLog(String message) {
    _logger.w('message: $message');
  }

  void printApiLog(String apiLog) {
    debugPrint('🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻');
    debugPrint('🌐Response=> $apiLog');
    debugPrint('🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺');
  }
}
