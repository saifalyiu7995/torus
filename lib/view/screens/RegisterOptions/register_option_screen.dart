import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Routes/app_navigation_routes.dart';
import 'package:tech_connect/provider/Auth/auth_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/view/widgets/CustomAppbar/custom_appbar.dart';
import 'package:tech_connect/view/widgets/CustomButton/custom_button.dart';

class RegisterOptionScreen extends StatefulWidget {
  const RegisterOptionScreen({Key? key}) : super(key: key);

  @override
  _RegisterOptionScreenState createState() => _RegisterOptionScreenState();
}

class _RegisterOptionScreenState extends State<RegisterOptionScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          leadingTitle: 'Register',
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: SizedBox(
            height: 90.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Consumer<AuthProvider>(
                builder: (context, value, child) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                        child: CustomButton(
                            color: AppColors.blueColorForgetPassword,
                            fontColor: AppColors.whiteColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            minSize: Size(100.w, 5.h),
                            title: "Register with Email",
                            onPressed: () => AppNavigation.navigateTo(
                                AppNavRoutes.registerRoute)
                            // value.signOutGoogle(),
                            )),
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
                      title: "Register with Google",
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
        )));
  }
}
