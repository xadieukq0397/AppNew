import 'package:get/get.dart';

class CheckOutController extends GetxController {
  var selectTransport = "".obs;
  var selectTypeDelivery = "".obs;
  var billCode = "".obs;
  var addressGuess = "".obs;
  onChangedTransport(var transport) {
    selectTransport.value = transport;
    print(transport);
  }

  onChangedDelivery(var delivery) {
    selectTypeDelivery.value = delivery;
    print(delivery);
  }

  onChangedBillCode(var billText) {
    billCode.value = billText;
    print(billText);
  }

  onChangedAddressGuess(var address) {
    addressGuess.value = address;
    print(address);
  }
}
