import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_connect/Routes/app_navigation.dart';

class HelperFunction {
  static Future<void> mainInitializer() async {
    WidgetsFlutterBinding.ensureInitialized();

    // await Firebase.initializeApp();
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  static Future<String> getguid() async {
    // String? token =
    //     await AppLocalData().getStringPrefValue(key: AppConstants.userTokenKey);
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);

    // return decodedToken['UserId'];

    return "";
  }

  static Future<void> openDatePicker(
      {required TextEditingController controller}) async {
    final DateTime? picked = await showDatePicker(
        context: AppNavigation.currentContext,
        firstDate: DateTime(1900),
        initialDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      controller.text = DateFormat("dd/MM/yyyy").format(picked);
    }
  }

  static Future<void> logout() async {
    // DialogBuilder.showLoadingIndicator();
    // try {
    //   await LogoutService.logoutRequest();
    //   AppInitializer().disconnect(Injector());
    //   AppLocalData().removeKeyData(key: AppConstants.userTokenKey);
    //   Future.delayed(const Duration(milliseconds: 100),
    //       () => AppNavigation.pushReplacementTo(AppNavRoutes.authRoute));
    // } catch (ex) {
    //   showSnackBar('$ex');
    // }
    // DialogBuilder.hideOpenDialog();
  }

  // static Future<String?> userData() async {
  //   // String? token =
  //   //     await AppLocalData().getStringPrefValue(key: AppConstants.userTokenKey);
  //   // return JwtDecoder.decode(token!)['Userfullname'];
  // }
}
