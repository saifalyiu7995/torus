import 'package:tech_connect/models/AuthModel/auth_request.dart';
import 'package:tech_connect/models/ForgerPassword/forget_request.dart';
import 'package:tech_connect/utils/network/api_base_helper.dart';

class ForgetService {
  static Future<ForgetResponse> forgetRequest({String? email}) async {
    try {
      AuthRequest _authRequest = AuthRequest(email: email);
      var response = await ApiBaseHelper.httpPostRequest("emailVerify",
          body: _authRequest.toJson());
      return ForgetResponse.fromJson(response);
    } catch (exception) {
      throw '$exception';
    }
  }
}
