import 'package:flutter/cupertino.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Routes/app_navigation_routes.dart';
import 'package:tech_connect/Services/OTP/otp_service.dart';
import 'package:tech_connect/models/OTP/otp_response.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/view/widgets/CustomDialogBoxes/loading_dialogbox.dart';
import 'package:tech_connect/view/widgets/CustomSnackbar/custom_snackbar.dart';

class OTPProvider extends ChangeNotifier {
  final otpController = TextEditingController();
  final formKeyOTP = GlobalKey<FormState>();

  String? otpValidator({String? value}) {
    if (value!.isNotEmpty) {
      if (value.length == 4) {
        return null;
      } else {
        return "Invalid OTP*";
      }
    } else {
      return "Required*";
    }
  }

  Future<void> otpAPI() async {
    DialogBuilder.showLoadingIndicator();
    try {
      if (formKeyOTP.currentState!.validate()) {
        FocusScope.of(AppNavigation.currentContext).requestFocus(FocusNode());
        OTPResponse response =
            await OTPService.otpRequest(email: otpController.text);
        if (response.status == "OK") {
          showSnackBar(response.message!, color: AppColors.greenFontColor);
          Future.delayed(const Duration(milliseconds: 100),
              () => AppNavigation.navigateTo(AppNavRoutes.changePasswordRoute));
        }
      }
    } catch (ex) {
      showSnackBar('$ex');
    }

    DialogBuilder.hideOpenDialog();
  }
}
