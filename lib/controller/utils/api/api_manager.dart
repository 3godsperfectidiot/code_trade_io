import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../model/api/api_model.dart';

enum APIMethod { post, get, delete, put }

class APIManager {
  static final APIManager apiManagerInstanace = APIManager._();
  factory APIManager() => apiManagerInstanace;
  APIManager._();

  Future<bool> _checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<ApiResponseModel> apiRequest(
    String webUrl,
    APIMethod method, {
    Map param = const {},
  }) async {
    final bool connectionStatus = await _checkConnection();
    late ApiResponseModel apiResponse;
    late ErrorModel error;
    if (!connectionStatus) {
      error = ErrorModel("No Internet", "Check Your Network Connection", 503);
      return apiResponse = ApiResponseModel(null, error, false);
    }
    late http.Response response;
    Map<String, String> headers = {"Content-Type": "application/json"};
    final Uri url = Uri.parse(webUrl);
    final String encodedData = json.encode(param);
    try {
      if (method == APIMethod.get) {
        response = await http.get(url, headers: headers);
      } else if (method == APIMethod.post) {
        response = await http.post(url, headers: headers, body: encodedData);
      } else if (method == APIMethod.put) {
        response = await http.put(url, headers: headers, body: encodedData);
      } else if (method == APIMethod.delete) {
        response = await http.delete(url, headers: headers);
      }
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isNotEmpty) {
          final responseData = json.decode(response.body);
          final prettyString =
              const JsonEncoder.withIndent('  ').convert(responseData);
          log(prettyString);
          apiResponse = ApiResponseModel(responseData, null, true);
        } else {
          error = ErrorModel(
            "Error",
            "We found some error.",
            response.statusCode,
          );
          apiResponse = ApiResponseModel(null, error, false);
        }
      } else if (response.statusCode == 401) {
        error = ErrorModel(
          "Unauthorized",
          "Token Expired, Please login again.",
          response.statusCode,
        );
        apiResponse = ApiResponseModel(null, error, false);
      } else if (response.statusCode == 500) {
        apiResponse = ApiResponseModel(
            null,
            ErrorModel('', 'Internal server error', response.statusCode),
            false);
      } else {
        error = ErrorModel(
          "Something went wrong!",
          "Looks like there was an error in reaching our servers. Press Refresh to try again or come back after some time.",
          504,
        );
        apiResponse = ApiResponseModel(null, error, false);
      }
    } catch (e) {
      error = ErrorModel(
        "Something went wrong!",
        e.toString(),
        504,
      );
      apiResponse = ApiResponseModel(null, error, false);
    }
    return apiResponse;
  }
}
