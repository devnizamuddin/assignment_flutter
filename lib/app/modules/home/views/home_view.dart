import 'package:assignment_flutter/app/components/single_row_item.dart';
import 'package:assignment_flutter/app/models/open_trade.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.onClickLogout,
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SingleRowItem(
                      title: 'Name',
                      value: controller.userModel.value?.name ?? '',
                    ),
                    const Divider(),
                    SingleRowItem(
                      title: 'City',
                      value: controller.userModel.value?.city ?? '',
                    ),
                    const Divider(),
                    SingleRowItem(
                      title: 'Country',
                      value: controller.userModel.value?.country ?? '',
                    ),
                    const Divider(),
                    SingleRowItem(
                      title: 'Phone',
                      value: controller.fourDigitNumber.value ,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: controller.openTradeModelList.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    OpenTradeModel model =
                        controller.openTradeModelList.value[index];
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SingleRowItem(
                              title: 'Ticket',
                              value: '${model.ticket ?? ''}',
                            ),
                            SingleRowItem(
                              title: 'Symbol',
                              value: model.symbol ?? '',
                            ),
                            SingleRowItem(
                              title: 'Current Price',
                              value: '${model.currentPrice ?? ''}',
                            ),
                            SingleRowItem(
                              title: 'Profit',
                              value: '${model.profit ?? ''}',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: SingleRowItem(
                title: 'Total Profit:',
                value: '${controller.totalProfit.value}',
              ),
            )
          ],
        ),
      ),
    );
  }
}
