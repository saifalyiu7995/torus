import 'package:tech_connect/models/AuthModel/auth_request.dart';
import 'package:tech_connect/models/AuthModel/auth_respone.dart';
import 'package:tech_connect/utils/network/api_base_helper.dart';

class AuthService {
  static Future<AuthResponse> loginRequest(
      String username, String password) async {
    try {
      AuthRequest _authRequest =
          AuthRequest(email: username, password: password);
      var response = await ApiBaseHelper.httpPostRequest("auth",
          body: _authRequest.toJson());
      return AuthResponse.fromJson(response);
    } catch (exception) {
      throw '$exception';
    }
  }
}
