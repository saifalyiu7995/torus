import 'package:flutter/cupertino.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Routes/app_navigation_routes.dart';
import 'package:tech_connect/Services/Register/register_provider.dart';
import 'package:tech_connect/models/Register/register_responsel.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';
import 'package:tech_connect/view/widgets/CustomDialogBoxes/loading_dialogbox.dart';
import 'package:tech_connect/view/widgets/CustomSnackbar/custom_snackbar.dart';

class RegisterProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final companyController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String dropDownValue = "";

  bool _obscureText = true;

  bool _obscureTextConfirm = true;

  bool get obscureText => _obscureText;

  bool get obscureTextConfirm => _obscureTextConfirm;

  void registerInit() {
    dropDownValue = AppConstants.countries[0]['name'];
  }

  void setDropDown({String? value}) {
    dropDownValue = value!;
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

  String? nameValidator({String? value, String? title = "Name"}) {
    if (value!.isNotEmpty) {
      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
        return "Invalid Input";
      } else {
        return null;
      }
    } else {
      return "$title is required*";
    }
  }

  String? companyNameValidator({String? value, String? title = "Name"}) {
    if (value!.isNotEmpty) {
      if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
        return "Invalid Input";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  String? contactValidator({String? value, String? title = "Name"}) {
    if (value!.isNotEmpty) {
      if (value.length > 15 || value.length < 9) {
        return "Invalid Number* (Min 9 Max 15 numbers)";
      } else {
        return null;
      }
    } else {
      return "$title is required*";
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

  String? confirmPasswordValidator({String? value}) {
    if (value!.isEmpty) {
      return "Password is required*";
    } else if (value.length < 8) {
      return "Enter at least 8 characters*";
    } else if (value != passwordController.text) {
      return "Password do not match*";
    } else {
      return null;
    }
  }

  Future<void> registerAPI({
    String? firstName,
    String? lastName,
    String? password,
    String? company,
    String? contact,
    String? email,
    String? country,
  }) async {
    DialogBuilder.showLoadingIndicator();
    try {
      if (formKey.currentState!.validate()) {
        RegisterResponse response = await RegisterService.registerRequest(
            company: company,
            contact: contact,
            country: country,
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName);

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

  void showHidePassword() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void showHideConfirmPassword() {
    _obscureTextConfirm = !_obscureTextConfirm;
    notifyListeners();
  }
}
