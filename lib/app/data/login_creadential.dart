import 'package:assignment_flutter/app/models/login_response.dart';
import 'package:get_storage/get_storage.dart';

import '../config/app_storage.dart';

class LoginCredential {
  late final GetStorage _getStorage;
  LoginCredential() {
    _getStorage = GetStorage();
  }

  void saveLoginResponse(LoginResponse model) {
    _getStorage.write(AppStorage.LOGIN_RESPONSE_KEY, model.toMap());
  }

  LoginResponse? getLoginResponse() {
    Map<String, dynamic>? responseMap =
        _getStorage.read(AppStorage.LOGIN_RESPONSE_KEY);
    if (responseMap != null) {
      LoginResponse? model = LoginResponse.fromMap(responseMap);
      return model;
    }

    return null;
  }

  void saveUserId(int userId) {
    _getStorage.write(AppStorage.USER_ID, userId);
  }

  int getUserId() {
    int userId = _getStorage.read(AppStorage.USER_ID);
    return userId;
  }

  void clearLoginCredential() {
    _getStorage.remove(AppStorage.LOGIN_RESPONSE_KEY);
    _getStorage.remove(AppStorage.USER_ID);
  }
}
