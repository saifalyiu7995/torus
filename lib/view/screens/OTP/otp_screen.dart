import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/provider/OTP/op_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/view/widgets/CustomAppbar/custom_appbar.dart';
import 'package:tech_connect/view/widgets/CustomButton/custom_button.dart';
import 'package:tech_connect/view/widgets/CustomTextFormField/custom_text_form_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          leadingTitle: 'OTP Verification',
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Consumer<OTPProvider>(
                  builder: (context, value, child) => Form(
                    key: value.formKeyOTP,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                            textFormTitle: "OTP",
                            isFilled: true,
                            controller: value.otpController,
                            inputType: TextInputType.number,
                            maxLength: 4,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) => value.otpValidator(value: v),
                            hintText: "OTP",
                            iconData: Icons.pin,
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
