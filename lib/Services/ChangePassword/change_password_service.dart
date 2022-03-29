import 'package:tech_connect/models/ChangePassword/change_request.dart';
import 'package:tech_connect/models/ChangePassword/change_response.dart';
import 'package:tech_connect/utils/network/api_base_helper.dart';

class ChangeService {
  static Future<ChangeResponse> changeRequest(
      {String? otp, String? password, String? token, String? email}) async {
    try {
      ChangePasswordRequest _authRequest = ChangePasswordRequest(
          otp: otp, newPassword: password, userEmail: email);
      var response = await ApiBaseHelper.httpPostRequest("api/password/reset",
          body: _authRequest.toJson());
      return ChangeResponse.fromJson(response);
    } catch (exception) {
      throw '$exception';
    }
  }
}
