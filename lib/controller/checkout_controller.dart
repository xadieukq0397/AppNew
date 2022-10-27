import 'package:get/get.dart';

class CheckOutController extends GetxController {
  String? selectTransport;
  String? selectTypeDelivery;
  String? billCode;
  String? addressGuess;
  String? selectXfast;
  bool? isSelected = false;

  void onChangedTransport(var transport) {
    selectTransport = transport;
    update();
    print(transport);
  }

  void onChangedDelivery(var delivery) {
    selectTypeDelivery = delivery;
    update();
    print(delivery);
  }

  void onChangedBillCode(var billText) {
    billCode = billText;
    update();
    print(billText);
  }

  void onSelectXfast(bool value) {
    selectXfast = value ? 'xteam' : "none";
    update();
  }
}
