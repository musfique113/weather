import 'package:weather/application/services/network_services/entities/failure.dart';

class ApiFailure {
  ApiFailure({this.success, this.responseCode, this.message});

  ApiFailure.fromJson(dynamic response) {
    if (response is Map<String, dynamic>) {
      success = response['success'] as bool?;
      responseCode = response['response_code'] as int?;
      final msg = response['message'];
      if (msg is String) {
        message = msg;
      } else if (msg is Map<String, dynamic>) {
        message = msg.toString();
      } else {
        message = null;
      }
    } else if (response is String) {
      message = response;
    } else {
      message = 'Unexpected error format.';
    }
  }

  bool? success;
  int? responseCode;
  String? message;

  Failure toEntity() {
    return Failure(message ?? 'Something went wrong.');
  }
}
