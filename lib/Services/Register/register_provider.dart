import 'package:tech_connect/models/Register/register_request.dart';
import 'package:tech_connect/models/Register/register_responsel.dart';
import 'package:tech_connect/utils/network/api_base_helper.dart';

class RegisterService {
  static Future<RegisterResponse> registerRequest(
      String username, String password) async {
    try {
      RegisterRequet _authRequest =
          RegisterRequet(email: username, password: password);
      var response = await ApiBaseHelper.httpPostRequest("auth",
          body: _authRequest.toJson());
      return RegisterResponse.fromJson(response);
    } catch (exception) {
      throw '$exception';
    }
  }
}
