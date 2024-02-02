import 'package:assignment_flutter/app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoader() {
  EasyLoading.show(status: 'Loading...');
}

void configLoader() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = PRIMARY_COLOR
    ..textColor = Colors.black;
}

void dismissLoader() {
  EasyLoading.dismiss();
}
