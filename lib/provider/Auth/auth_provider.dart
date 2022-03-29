import 'package:flutter/material.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Routes/app_navigation_routes.dart';
import 'package:tech_connect/Services/Auth/auth_service.dart';
import 'package:tech_connect/SharedPreference/shared_preference.dart';
import 'package:tech_connect/models/AuthModel/auth_respone.dart';
import 'package:tech_connect/utils/app/app_constant.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tech_connect/view/widgets/CustomDialogBoxes/loading_dialogbox.dart';
import 'package:tech_connect/view/widgets/CustomSnackbar/custom_snackbar.dart';

class AuthProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authformKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool biometricAvailable = false;
  late AuthResponse response;

  String? userName = "";
  String? userImage = "";

  GoogleSignInAccount? user;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  bool get obscureText => _obscureText;

  googleSignInInit() async {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      user = account;
    });

    user = await _googleSignIn.signInSilently();

    if (user != null) {
      AppLocalData()
          .setStringPrefValue(key: AppConstants.userIdKey, value: user!.id);

      Future.delayed(const Duration(microseconds: 100),
          () => AppNavigation.pushReplacementTo(AppNavRoutes.dashboardRoute));
    } else {
      String? token = await AppLocalData()
          .getStringPrefValue(key: AppConstants.userTokenKey);
      if (token == null || token == "") {
        Future.delayed(const Duration(microseconds: 100),
            () => AppNavigation.pushReplacementTo(AppNavRoutes.authRoute));
      } else {
        userName =
            await AppLocalData().getStringPrefValue(key: AppConstants.userName);
        userImage = await AppLocalData()
            .getStringPrefValue(key: AppConstants.userImage);

        Future.delayed(const Duration(microseconds: 100),
            () => AppNavigation.pushReplacementTo(AppNavRoutes.dashboardRoute));
      }
    }
  }

  signOutGoogle() async {
    AppLocalData()
        .setStringPrefValue(key: AppConstants.userTokenKey, value: "");
    AppLocalData().setStringPrefValue(key: AppConstants.userName, value: "");
    AppLocalData().setStringPrefValue(key: AppConstants.userImage, value: "");

    if (user == null) {
      AppLocalData().setStringPrefValue(key: AppConstants.userIdKey, value: '');
      Future.delayed(const Duration(microseconds: 100),
          () => AppNavigation.pushAndKillAll(AppNavRoutes.authRoute));
    } else {
      user = await _googleSignIn.disconnect();
      // showSnackBar(AppConstants.exceptionMessage);
    }
  }

  Future<void> signInGoogle() async {
    DialogBuilder.showLoadingIndicator();
    try {
      user = await _googleSignIn.signIn();

      if (user!.displayName != null) {
        AppLocalData()
            .setStringPrefValue(key: AppConstants.userIdKey, value: user!.id);
        Future.delayed(const Duration(microseconds: 100),
            () => AppNavigation.pushAndKillAll(AppNavRoutes.dashboardRoute));
      } else {
        showSnackBar(AppConstants.exceptionMessage);
      }

      // await _googleSignIn.signIn();
    } catch (e) {
      showSnackBar(AppConstants.exceptionMessage);
    }

    DialogBuilder.hideOpenDialog();
  }

  // void checkBiometric() async {
  //   biometricAvailable = await LocalAuthApi.hasBiometrics();
  // }

  void showHidePassword() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  String? emailValidator({String? value}) {
    if (value!.isNotEmpty) {
      if (AppConstants.emailRegex.hasMatch(value)) {
        return null;
      } else {
        return "Invalid email*";
      }
    } else {
      return "Email is required*";
    }
  }

  String? passwordValidator({String? value}) {
    if (value!.isEmpty) {
      return "Password is required*";
    } else if (value.length < 8) {
      return "Enter at least 8 characters";
    } else if (!RegExp(
            r'^(?=.{8,}$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W).*$')
        .hasMatch(value)) {
      return "Example: { Axyz@123 }";
    } else {
      return null;
    }
  }

  void disposeData() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> passLogin() async {
    DialogBuilder.showLoadingIndicator();
    try {
      if (authformKey.currentState!.validate()) {
        FocusScope.of(AppNavigation.currentContext).requestFocus(FocusNode());
        response = await AuthService.loginRequest(
            emailController.text, passwordController.text);
        await AppLocalData().setStringPrefValue(
            key: AppConstants.userTokenKey, value: response.data!.accessToken!);
        await AppLocalData().setStringPrefValue(
            key: AppConstants.userName, value: response.data!.fullname!);
        await AppLocalData().setStringPrefValue(
            key: AppConstants.userImage,
            value: "https://www.w3schools.com/howto/img_avatar.png");
        Future.delayed(const Duration(milliseconds: 100),
            () => AppNavigation.pushReplacementTo(AppNavRoutes.dashboardRoute));
      }
    } catch (ex) {
      showSnackBar('$ex');
    }

    userName =
        await AppLocalData().getStringPrefValue(key: AppConstants.userName);
    userImage =
        await AppLocalData().getStringPrefValue(key: AppConstants.userImage);

    DialogBuilder.hideOpenDialog();
  }

  // void disposeData() {
  //   emailController.clear();
  //   passwordController.clear();
  //   _obscureText = true;
  // }

  // void checkRegisteredFingerprint() async {
  //   String? userId =
  //       await AppLocalData().getStringPrefValue(key: AppConstants.userIdKey);
  //   if (userId != null) {
  //     AppNavigation.pushReplacementTo(AppNavRoutes.loginWithFingerprintRoute);
  //   } else {
  //     DialogBuilder.fingerprintDialog();
  //   }
  // }
}
