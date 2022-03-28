import 'package:flutter/cupertino.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Routes/app_navigation_routes.dart';
import 'package:tech_connect/Services/ForgetPassword/forget_password_service.dart';
import 'package:tech_connect/models/ForgerPassword/forget_request.dart';
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

  Future<void> forgetAPI() async {
    DialogBuilder.showLoadingIndicator();
    try {
      if (formKey.currentState!.validate()) {
        FocusScope.of(AppNavigation.currentContext).requestFocus(FocusNode());
        ForgetResponse response =
            await ForgetService.forgetRequest(email: emailController.text);
        if (response.status!) {
          Future.delayed(const Duration(milliseconds: 100),
              () => AppNavigation.navigateTo(AppNavRoutes.otpRoute));
        }
      }
    } catch (ex) {
      showSnackBar('$ex');
    }

    notifyListeners();
    DialogBuilder.hideOpenDialog();
  }
}
