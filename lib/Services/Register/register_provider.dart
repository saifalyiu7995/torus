import 'package:tech_connect/models/Register/register_request.dart';
import 'package:tech_connect/models/Register/register_responsel.dart';
import 'package:tech_connect/utils/network/api_base_helper.dart';

class RegisterService {
  static Future<RegisterResponse> registerRequest({
    String? firstName,
    String? lastName,
    String? password,
    String? company,
    String? contact,
    String? email,
    String? country,
  }) async {
    try {
      RegisterRequest _authRequest = RegisterRequest(
          email: email,
          password: password,
          companyName: company,
          contactNo: contact,
          country: country,
          firstName: firstName,
          lastName: lastName);
      var response = await ApiBaseHelper.httpPostRequest("api/technician",
          body: _authRequest.toJson());
      print(response);
      return RegisterResponse.fromJson(response);
    } catch (exception) {
      throw '$exception';
    }
  }
}
