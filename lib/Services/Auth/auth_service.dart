import 'package:tech_connect/models/AuthModel/auth_request.dart';
import 'package:tech_connect/models/AuthModel/auth_respone.dart';
import 'package:tech_connect/utils/network/api_base_helper.dart';

class AuthService {
  static Future<AuthResponse> loginRequest(
      String username, String password) async {
    try {
      AuthRequest _authRequest =
          AuthRequest(email: username, password: password);
      var body = _authRequest.toJson();
      var response = await ApiBaseHelper.httpPostRequestUrlEnc("login",
          body: body.keys.map((key) => "$key=${body[key]}").join("&"));
      return AuthResponse.fromJson(response);
    } catch (exception) {
      throw '$exception';
    }
  }
}
