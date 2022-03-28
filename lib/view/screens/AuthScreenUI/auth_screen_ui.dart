import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Routes/app_navigation_routes.dart';
import 'package:tech_connect/provider/Auth/auth_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';
import 'package:tech_connect/view/widgets/CustomButton/custom_button.dart';
import 'package:tech_connect/view/widgets/CustomTextFormField/custom_text_form_field.dart';

class AuthScreenUI extends StatefulWidget {
  const AuthScreenUI({Key? key}) : super(key: key);

  @override
  _AuthScreenUIState createState() => _AuthScreenUIState();
}

class _AuthScreenUIState extends State<AuthScreenUI> {
  @override
  void dispose() {
    Provider.of<AuthProvider>(AppNavigation.currentContext, listen: false)
        .disposeData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 5.h),
            Image(
              image: const AssetImage('${AppConstants.assetImages}logo.png'),
              height: 10.h,
              width: 80.w,
            ),
            SizedBox(height: 6.h),
            Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: AppColors.fontDarkColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppConstants.textFont),
                ),
                Text(
                  "Please Login to continue",
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.fontDarkColor,
                      fontFamily: AppConstants.textFont),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Consumer<AuthProvider>(
                builder: (context, value, child) => Form(
                  key: value.authformKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                          textFormTitle: "Email",
                          isFilled: true,
                          controller: value.emailController,
                          inputType: TextInputType.visiblePassword,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (v) => value.emailValidator(value: v),
                          hintText: "Email",
                          iconData: Icons.email_rounded,
                          obscureText: false),
                      CustomTextFormField(
                          textFormTitle: "Password",
                          isFilled: true,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          controller: value.passwordController,
                          inputType: TextInputType.visiblePassword,
                          inputAction: TextInputAction.done,
                          validator: (v) => value.passwordValidator(value: v),
                          hintText: "Password",
                          suffixWidget: InkWell(
                            onTap: () => value.showHidePassword(),
                            child: Icon(
                              !value.obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.fontDarkColor,
                            ),
                          ),
                          iconData: Icons.lock,
                          obscureText: value.obscureText),
                      GestureDetector(
                        onTap: () => AppNavigation.navigateTo(
                            AppNavRoutes.forgetPasswordRoute),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 12.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Center(
                          child: CustomButton(
                        color: AppColors.primaryColor,
                        fontColor: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        minSize: Size(80.w, 5.h),
                        title: "Login",
                        onPressed: () => value.passLogin(),
                      )),
                      SizedBox(
                        height: 0.8.h,
                      ),
                      GestureDetector(
                        onTap: () => AppNavigation.navigateTo(
                            AppNavRoutes.registerRoute),
                        child: Center(
                          child: Text(
                            "Create account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blueColorForgetPassword,
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                        child: Text(
                          "OR",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.fontColorDark,
                              fontWeight: FontWeight.w800,
                              fontSize: 14.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                          child: CustomButton(
                        color: AppColors.valuesRedColors,
                        fontColor: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        minSize: Size(80.w, 5.h),
                        title: "Sign-in with Google",
                        onPressed: () => value.signInGoogle(),
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
      ),
    )));
  }
}
