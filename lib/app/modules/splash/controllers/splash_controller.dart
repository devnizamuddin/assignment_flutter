import 'dart:async';

import 'package:assignment_flutter/app/data/login_creadential.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  LoginCredential loginCredential = LoginCredential();
  void navigate() async {
    Timer(const Duration(seconds: 3), () {
      if (loginCredential.getLoginResponse() != null) {
        Get.offNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }
}
