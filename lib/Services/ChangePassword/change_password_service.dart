import 'package:tech_connect/models/ChangePassword/change_request.dart';
import 'package:tech_connect/models/ChangePassword/change_response.dart';
import 'package:tech_connect/utils/network/api_base_helper.dart';

class ChangeService {
  static Future<ChangeResponse> changeRequest(
      {String? password, String? token}) async {
    try {
      ChangeRequest _authRequest =
          ChangeRequest(password: password, token: token);
      var response = await ApiBaseHelper.httpPostRequest("emailVerify",
          body: _authRequest.toJson());
      return ChangeResponse.fromJson(response);
    } catch (exception) {
      throw '$exception';
    }
  }
}
