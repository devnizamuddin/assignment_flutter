import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../config/api_constant.dart';
import '../data/login_creadential.dart';
import '../utils/loader.dart';
import '../utils/snackbar.dart';

class ApiCommunication {
  late dio.Dio _dio;
  final String baseUrl = ApiConstant.BASE_URL;
  late Map<String, dynamic> header;
  late Connectivity connectivity;
  late LoginCredential _loginCredential;
  late String? token;

  ApiCommunication({int? connectTimeout, int? receiveTimeout}) {
    _dio = Dio();
    _dio.options.connectTimeout =
        Duration(milliseconds: connectTimeout ?? 60000); //1000 = 1s
    _dio.options.receiveTimeout =
        Duration(milliseconds: receiveTimeout ?? 60000);

    connectivity = Connectivity();
    _loginCredential = LoginCredential();
    token = _loginCredential.getLoginResponse().token;
    header = {
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };
  }

  Future<bool> isConnectedToInternet() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  Future<dio.Response?> doPostRequest({
    required String apiEndPoint,
    Map<String, dynamic>? requestData,
    bool enableLoading = true,
    String? successMessage,
    bool showSuccessMessage = false,
    String? errorMessage,
  }) async {
    dio.Response? response;
    String requestUrl = '${ApiConstant.BASE_URL}$apiEndPoint';

    debugPrint('Request Url: $requestUrl\n Request Data: $requestData\n');

    if (await isConnectedToInternet()) {
      try {
        if (enableLoading) showLoader();
        response = await _dio.post(
          requestUrl,
          data: requestData,
          options: dio.Options(headers: header),
        );
        if (enableLoading) dismissLoader();
      } on DioException catch (error) {
        if (enableLoading) dismissLoader();
        String errorMessage = error.response?.data as String;
        showErrorSnackkbar(message: errorMessage);
        debugPrint(errorMessage);
        return null;
      } on SocketException catch (e) {
        if (enableLoading) dismissLoader();
        String errorMessage = e.message;
        debugPrint(errorMessage);
        showErrorSnackkbar(message: errorMessage);
        return null;
      } catch (e) {
        if (enableLoading) dismissLoader();
        String errorMessage = e.toString();
        debugPrint(errorMessage);
        showErrorSnackkbar(message: errorMessage);
        return null;
      }

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        showSuccessMessage
            ? showSuccessSnackkbar(
                message: successMessage ?? responseData['message'])
            : ();
        debugPrint('$responseData');
        return response;
      } else {
        showErrorSnackkbar(message: '${response.statusCode}');
        debugPrint('${response.statusCode}');
        return null;
      }
    } else {
      errorMessage = 'You are not connected with mobile/wifi network';
      showWarningSnackkbar(message: errorMessage);
      debugPrint(errorMessage);
      return null;
    }
  }

  void endConnection() => _dio.close(force: true);
}
