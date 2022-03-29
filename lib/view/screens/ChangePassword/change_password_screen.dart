import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/provider/ChangePassword/change_password_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';
import 'package:tech_connect/view/widgets/CustomAppbar/custom_appbar.dart';
import 'package:tech_connect/view/widgets/CustomButton/custom_button.dart';
import 'package:tech_connect/view/widgets/CustomTextFormField/custom_text_form_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          leadingTitle: 'Change Password',
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Consumer<ChangePasswordProvider>(
                  builder: (context, value, child) => Form(
                    key: value.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                            textFormTitle: "OTP",
                            isFilled: true,
                            controller: value.otpController,
                            inputType: TextInputType.number,
                            maxLength: 6,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) => value.otpValidator(value: v),
                            hintText: "OTP",
                            iconData: Icons.pin,
                            obscureText: false),
                        CustomTextFormField(
                            textFormTitle: "New Password",
                            isFilled: true,
                            controller: value.newPasswordController,
                            inputType: TextInputType.visiblePassword,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) => value.passwordValidator(value: v),
                            hintText: "New Password",
                            iconData: Icons.lock_rounded,
                            obscureText: true),
                        CustomTextFormField(
                            textFormTitle: "Confirm Password",
                            isFilled: true,
                            controller: value.confirmPasswordController,
                            inputType: TextInputType.visiblePassword,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) =>
                                value.confirmPaswordValidator(value: v),
                            hintText: "Confirm New Password",
                            iconData: Icons.lock_rounded,
                            leadingIcon:
                                "${AppConstants.assetIcons}user_icon.svg",
                            obscureText: true),
                        SizedBox(
                          height: 1.h,
                        ),
                        Center(
                            child: CustomButton(
                          color: AppColors.blueColorForgetPassword,
                          fontColor: AppColors.whiteColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          minSize: Size(100.w, 5.h),
                          title: "Submit",
                          onPressed: () => value.changeAPI(),
                        )),
                        SizedBox(
                          height: 7.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
