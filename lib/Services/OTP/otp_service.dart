import 'package:tech_connect/models/OTP/otp_request.dart';
import 'package:tech_connect/models/OTP/otp_response.dart';
import 'package:tech_connect/utils/network/api_base_helper.dart';

class OTPService {
  static Future<OTPResponse> otpRequest({String? email}) async {
    try {
      OTPRequest _authRequest = OTPRequest(email: email);
      var response = await ApiBaseHelper.httpPostRequest("api/password/forgot",
          body: _authRequest.toJson());
      return OTPResponse.fromJson(response);
    } catch (exception) {
      throw '$exception';
    }
  }
}
