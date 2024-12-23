import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather/application/services/network_services/responses/network_response.dart';

import 'package:weather/application/helpers/logger.dart';

class NetworkExecutor with AppLogger {
  void _logRequest({
    required String method,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) {
    if (kDebugMode) {
      printApiLog('--- $method Request ---');
      printApiLog('URL: $url');
      if (queryParams != null) {
        printApiLog('Query Parameters: $queryParams');
      }
      if (headers != null) {
        printApiLog('Headers: $headers');
      }
      if (body != null) {
        printApiLog('Body: ${jsonEncode(body)}');
      }
      printApiLog('-----------------------');
    }
  }

  Future<NetworkResponse> _executeRequest(
    Future<http.Response> Function() requestFunction,
  ) async {
    try {
      final response = await requestFunction();

      if (kDebugMode) {
        printApiLog('--- Response ---');
        printApiLog('Status Code: ${response.statusCode}');
        printApiLog('Headers: ${response.headers}');
        printApiLog('Body: ${response.body}');
        printApiLog('----------------');
      }

      return NetworkResponse(
        response.statusCode,
        response.body,
        response.headers,
        response.reasonPhrase ?? 'Unknown status',
      );
    } catch (e) {
      if (kDebugMode) {
        printApiLog('Network error: $e');
      }
      return NetworkResponse(
        -1,
        null,
        null,
        'Network error: $e',
      );
    }
  }

  Future<NetworkResponse> getRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = Uri.parse(url).replace(
      queryParameters: queryParams?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    _logRequest(
      method: 'GET',
      url: uri.toString(),
      headers: headers,
      queryParams: queryParams,
    );

    return _executeRequest(() => http.get(uri, headers: headers));
  }

  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    _logRequest(
      method: 'POST',
      url: url,
      headers: headers,
      body: body,
    );

    return _executeRequest(
      () => http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      ),
    );
  }

  Future<NetworkResponse> putRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    _logRequest(
      method: 'PUT',
      url: url,
      headers: headers,
      body: body,
    );

    return _executeRequest(
      () => http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      ),
    );
  }

  Future<NetworkResponse> patchRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    _logRequest(
      method: 'PATCH',
      url: url,
      headers: headers,
      body: body,
    );

    return _executeRequest(
      () => http.patch(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      ),
    );
  }

  Future<NetworkResponse> deleteRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    _logRequest(
      method: 'DELETE',
      url: url,
      headers: headers,
      body: body,
    );

    return _executeRequest(
      () => http.delete(
        Uri.parse(url),
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      ),
    );
  }
}
