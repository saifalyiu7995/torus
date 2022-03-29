import 'package:flutter/cupertino.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Services/ChangePassword/change_password_service.dart';
import 'package:tech_connect/models/ChangePassword/change_response.dart';
import 'package:tech_connect/provider/ForgetPassword/forget_password_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/view/widgets/CustomDialogBoxes/loading_dialogbox.dart';
import 'package:tech_connect/view/widgets/CustomSnackbar/custom_snackbar.dart';
import 'package:provider/provider.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  String? otpValidator({String? value}) {
    if (value!.isNotEmpty) {
      if (value.length == 6) {
        return null;
      } else {
        return "Invalid OTP*";
      }
    } else {
      return "Required*";
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

  String? confirmPaswordValidator({String? value}) {
    if (value!.isEmpty) {
      return "Password is required*";
    } else if (value.length < 8) {
      return "Enter at least 8 characters";
    } else if (!RegExp(
            r'^(?=.{8,}$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W).*$')
        .hasMatch(value)) {
      return "Example: { Axyz@123 }";
    } else if (value != newPasswordController.text) {
      return "Password not match*";
    } else {
      return null;
    }
  }

  Future<void> changeAPI() async {
    DialogBuilder.showLoadingIndicator();
    try {
      if (formKey.currentState!.validate()) {
        FocusScope.of(AppNavigation.currentContext).requestFocus(FocusNode());
        ChangeResponse response = await ChangeService.changeRequest(
            password: newPasswordController.text,
            token: "",
            email: Provider.of<ForgetProvider>(AppNavigation.currentContext,
                    listen: false)
                .emailController
                .text,
            otp: otpController.text);
        if (response.status == "OK") {
          showSnackBar(response.message!, color: AppColors.greenFontColor);
          Future.delayed(const Duration(milliseconds: 100),
              () => AppNavigation.removeAllRoutes());
        } else {
          showSnackBar(response.message!, color: AppColors.valuesRedColors);
        }
      }
    } catch (ex) {
      showSnackBar('$ex');
    }

    DialogBuilder.hideOpenDialog();
  }
}
