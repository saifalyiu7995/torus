import 'package:flutter/cupertino.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Routes/app_navigation_routes.dart';
import 'package:tech_connect/Services/OTP/otp_service.dart';
import 'package:tech_connect/models/OTP/otp_response.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';
import 'package:tech_connect/view/widgets/CustomDialogBoxes/loading_dialogbox.dart';
import 'package:tech_connect/view/widgets/CustomSnackbar/custom_snackbar.dart';

class ForgetProvider extends ChangeNotifier {
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? userNameValidator({String? value}) {
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

  Future<void> otpAPI() async {
    DialogBuilder.showLoadingIndicator();
    try {
      if (formKey.currentState!.validate()) {
        FocusScope.of(AppNavigation.currentContext).requestFocus(FocusNode());
        OTPResponse response =
            await OTPService.otpRequest(email: emailController.text);
        if (response.status == "OK") {
          showSnackBar(response.message!, color: AppColors.greenFontColor);
          Future.delayed(const Duration(milliseconds: 100),
              () => AppNavigation.navigateTo(AppNavRoutes.changePasswordRoute));
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
