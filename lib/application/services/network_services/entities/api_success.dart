import 'package:weather/application/services/network_services/entities/success.dart';

class ApiSuccess {
  ApiSuccess({this.success, this.responseCode, this.message});

  ApiSuccess.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      success = json['success'] as bool?;
      responseCode = json['response_code'] as int?;
      final msg = json['message'];
      if (msg is String) {
        message = msg;
      } else if (msg is Map<String, dynamic>) {
        message = msg.toString();
      } else {
        message = null;
      }
    } else if (json is String) {
      message = json;
    } else {
      message = 'Unexpected error format.';
    }
  }

  bool? success;
  int? responseCode;
  String? message;

  Success toEntity() {
    return Success(message);
  }
}
