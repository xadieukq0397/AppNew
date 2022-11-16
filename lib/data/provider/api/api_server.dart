import 'package:get/get.dart';

class ApiServer extends GetConnect implements GetxService {
  late String products;
  final String baseUrlSever;
  late Map<String, String> _mainHeader = {};
  ApiServer({required this.baseUrlSever}) {
    baseUrl = baseUrlSever;
    timeout = const Duration(seconds: 30);
    _mainHeader = {};
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainHeader);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
