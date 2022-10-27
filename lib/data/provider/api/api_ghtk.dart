import 'package:get/get.dart';
import 'package:responsive_login_ui/config/app_constants.dart';

class ApiGHTK extends GetConnect implements GetxService {
  late String token;
  final String baseUrlGHTK;
  late Map<String, String> _mainHeader = {};

  ApiGHTK({required this.baseUrlGHTK}) {
    baseUrl = baseUrlGHTK;
    timeout = const Duration(seconds: 30);
    token = AppConstants.tokenGHTK;
    _mainHeader = {'Token': token};
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query}) async {
    print(query);
    try {
      Response response = await get(uri, headers: _mainHeader, query: query);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
