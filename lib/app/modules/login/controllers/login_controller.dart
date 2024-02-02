import 'package:assignment_flutter/app/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/login_creadential.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_communication.dart';

class LoginController extends GetxController {
  late final TextEditingController userIdController;
  late final TextEditingController passwordController;
  Rx<bool> obscureText = true.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  late ApiCommunication _apiCommunication;
  late LoginCredential _loginCredential;

  void onPressedLogin() async {
    if (loginFormKey.currentState!.validate()) {
      int userId = int.parse(userIdController.text);
      String password = passwordController.text;
      final response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'ClientCabinetBasic/IsAccountCredentialsCorrect',
        requestData: {
          'login': userId,
          'password': password,
        },
        showSuccessMessage: true,
        successMessage: 'You are successfully logged in',
      );
      if (response != null) {
        Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;
        LoginResponse loginResponse = LoginResponse.fromMap(
            responseData); //Retrieving User data from Login Response
        _loginCredential.saveLoginResponse(loginResponse);
        _loginCredential.saveUserId(userId);
        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    _apiCommunication = ApiCommunication();
    _loginCredential = LoginCredential();
  }

  @override
  void onClose() {
    super.onClose();
    userIdController.dispose();
    passwordController.dispose();
    _apiCommunication.endConnection();
  }
}
