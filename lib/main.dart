import 'package:assignment_flutter/assignment_app.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'app/utils/loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  configLoader();
  runApp(
    const AssignmentApp(),
  );
}
