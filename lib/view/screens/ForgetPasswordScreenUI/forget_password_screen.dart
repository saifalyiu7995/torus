import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/provider/ForgetPassword/forget_password_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';
import 'package:tech_connect/view/widgets/CustomAppbar/custom_appbar.dart';
import 'package:tech_connect/view/widgets/CustomButton/custom_button.dart';
import 'package:tech_connect/view/widgets/CustomTextFormField/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          leadingTitle: 'Forget Password',
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Consumer<ForgetProvider>(
                  builder: (context, value, child) => Form(
                    key: value.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                            textFormTitle: "Email",
                            isFilled: true,
                            controller: value.emailController,
                            inputType: TextInputType.visiblePassword,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) => value.userNameValidator(value: v),
                            hintText: "Email",
                            leadingIcon:
                                "${AppConstants.assetIcons}user_icon.svg",
                            obscureText: false),
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
                          onPressed: () => value.otpAPI(),
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
