import 'package:assignment_flutter/app/utils/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/app_assets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.navigate();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.APP_LOGO,
              width: Get.width / 2.5,
            ),
            SizedBox(height: Get.height / 5),
            const SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                color: PRIMARY_COLOR,
                backgroundColor: Colors.amber,
              ),
            ),
            SizedBox(height: Get.height / 5),
            SizedBox(
              width: Get.width / 1.8,
              child: const Text(
                'APPLE GADGETS',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.6,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
