import 'package:flutter/cupertino.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Services/ChangePassword/change_password_service.dart';
import 'package:tech_connect/models/ChangePassword/change_response.dart';
import 'package:tech_connect/view/widgets/CustomDialogBoxes/loading_dialogbox.dart';
import 'package:tech_connect/view/widgets/CustomSnackbar/custom_snackbar.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? paswordValidator({String? value}) {
    if (value!.isNotEmpty) {
      if (value.length < 8) {
        return "Invalid Password* (Min 8 characters)";
      } else {
        return null;
      }
    } else {
      return "Required*";
    }
  }

  String? confirmPaswordValidator({String? value}) {
    if (value!.isNotEmpty) {
      if (value.length < 8) {
        return "Invalid Password* (Min 8 characters)";
      } else if (value != newPasswordController.text) {
        return "Password not match*";
      } else {
        return null;
      }
    } else {
      return "Required*";
    }
  }

  Future<void> changeAPI() async {
    DialogBuilder.showLoadingIndicator();
    try {
      if (formKey.currentState!.validate()) {
        FocusScope.of(AppNavigation.currentContext).requestFocus(FocusNode());
        ChangeResponse response = await ChangeService.changeRequest(
            password: newPasswordController.text, token: "");
        if (response.status!) {
          Future.delayed(const Duration(milliseconds: 100),
              () => AppNavigation.removeAllRoutes());
        }
      }
    } catch (ex) {
      showSnackBar('$ex');
    }

    DialogBuilder.hideOpenDialog();
  }
}
