
// class LogoutService {
//   static Future<LogoutResponse> logoutRequest() async {
//     try {
//       var token = await AppLocalData()
//           .getStringPrefValue(key: AppConstants.userTokenKey);
//       var response =
//           await ApiBaseHelper.httpPostRequest("Auth/Logout", token: token);
//       return LogoutResponse.fromJson(response);
//     } catch (e) {
//       throw '$e';
//     }
//   }
// }
