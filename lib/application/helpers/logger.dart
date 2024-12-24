import 'package:logger/logger.dart';

mixin AppLogger {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      lineLength: 100,
      levelEmojis: {
        Level.trace: '🔍',
        Level.debug: '🐛',
        Level.info: 'ℹ️',
        Level.warning: '⚠️',
        Level.error: '❌',
        Level.fatal: '🔥',
      },
      dateTimeFormat: DateTimeFormat.onlyTime,
    ),
  );

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

  void printApiLog({
    required String apiLog,
    required String method,
    required String url,
    required Map<String, dynamic> header,
  }) {
    _logger.w('''
    Request Type => $method
    Base Url => $url
    Header => $header
    
    Response => $apiLog
    ''');
  }
}
