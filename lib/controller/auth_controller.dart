import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isObscure = true;

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  isObscureActive() {
    isObscure = !isObscure;
    update();
  }
}
