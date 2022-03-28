import 'package:tech_connect/models/OTP/otp_request.dart';
import 'package:tech_connect/models/OTP/otp_response.dart';
import 'package:tech_connect/utils/network/api_base_helper.dart';

class OTPService {
  static Future<OTPResponse> otpRequest({String? otp, String? token}) async {
    try {
      OTPRequest _authRequest = OTPRequest(otp: otp, token: token);
      var response = await ApiBaseHelper.httpPostRequest("otpVerify",
          body: _authRequest.toJson());
      return OTPResponse.fromJson(response);
    } catch (exception) {
      throw '$exception';
    }
  }
}
