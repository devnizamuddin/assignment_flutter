import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../components/button.dart';
import '../../../components/text_form_field.dart';
import '../../../config/app_assets.dart';
import '../../../utils/color.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 128),
                  const Image(
                      height: 128, image: AssetImage(AppAssets.APP_LOGO)),
                  const SizedBox(height: 20),
                  const Text(
                    'Apple Gadgets',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 80),
                  PrimaryTextFormField(
                    label: 'User Id',
                    obscureText: false,
                    prefixIcon: Icons.person,
                    validationText: 'User id is required',
                    controller: controller.userIdController,
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  Obx(() => PrimaryTextFormField(
                        label: 'Password',
                        prefixIcon: Icons.lock,
                        controller: controller.passwordController,
                        obscureText: controller.obscureText.value,
                        validationText: 'Password is required',
                        suffixIconButton: IconButton(
                            onPressed: () {
                              controller.obscureText.value =
                                  !controller.obscureText.value;
                            },
                            icon: Icon(
                              controller.obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: PRIMARY_COLOR,
                            )),
                      )),
                  const SizedBox(height: 20),
                  PrimaryButton(
                      onPressed: controller.onPressedLogin, text: 'LOGIN'),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
