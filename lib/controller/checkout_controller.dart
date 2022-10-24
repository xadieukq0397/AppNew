import 'package:get/get.dart';

class CheckOutController extends GetxController {
  String? selectTransport;
  String? selectTypeDelivery;
  String? billCode;
  String? addressGuess;

  onChangedTransport(var transport) {
    selectTransport = transport;
    update();
    print(transport);
  }

  onChangedDelivery(var delivery) {
    selectTypeDelivery = delivery;
    update();
    print(delivery);
  }

  onChangedBillCode(var billText) {
    billCode = billText;
    update();
    print(billText);
  }
}
