import 'package:assignment_flutter/app/models/open_trade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/login_creadential.dart';
import '../../../models/user.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_communication.dart';

class HomeController extends GetxController {
  late ApiCommunication _apiCommunication;
  late LoginCredential _loginCredential;
  Rx<UserModel?> userModel = Rx(null);
  Rx<List<OpenTradeModel>> openTradeModelList = Rx([]);
  Rx<double> totalProfit = 0.0.obs;
  Rx<String> fourDigitNumber = ''.obs;

  Future<void> getAccountInformation() async {
    final response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'ClientCabinetBasic/GetAccountInformation',
      requestData: {
        'login': _loginCredential.getUserId(),
        'token': _loginCredential.getLoginResponse()!.token,
      },
    );
    if (response != null) {
      Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
      userModel.value = UserModel.fromMap(
          responseData); //Retrieving User data from Login Response
    }
  }

  Future<void> getLastFourNumbersPhone() async {
    final response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'ClientCabinetBasic/GetLastFourNumbersPhone',
      requestData: {
        'login': _loginCredential.getUserId(),
        'token': _loginCredential.getLoginResponse()!.token,
      },
    );
    if (response != null) {
      fourDigitNumber.value = response.data.toString();
      debugPrint(response.data.toString());
    }
  }

  Future<void> getOpenTrades() async {
    final response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'ClientCabinetBasic/GetOpenTrades',
      requestData: {
        'login': _loginCredential.getUserId(),
        'token': _loginCredential.getLoginResponse()!.token,
      },
    );
    if (response != null) {
      final responseData = response.data;
      openTradeModelList.value = (responseData as List)
          .map((element) => OpenTradeModel.fromMap(element))
          .toList();
      debugPrint(responseData.toString());
    }
  }

  void calculateProfit() {
    if (openTradeModelList.value.isNotEmpty) {
      for (OpenTradeModel model in openTradeModelList.value) {
        totalProfit += model.profit ?? 0.0;
      }
    }
  }

  void onClickLogout() {
    _loginCredential.clearLoginCredential();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() async {
    _apiCommunication = ApiCommunication();
    _loginCredential = LoginCredential();
    super.onInit();
  }

  @override
  void onReady() async {
    await getAccountInformation();
    await getLastFourNumbersPhone();
    await getOpenTrades();
    calculateProfit();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _apiCommunication.endConnection();
  }
}
