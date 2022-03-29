import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/view/widgets/CustomAppbar/custom_appbar.dart';
import 'package:tech_connect/view/widgets/CustomButton/custom_button.dart';
import 'package:tech_connect/view/widgets/CustomDropDown/custom_drop_down.dart';
import 'package:tech_connect/view/widgets/CustomTextFormField/custom_text_form_field.dart';

import '../../../utils/app/app_constant.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  int _index = 0;
  String? valueChoose;
  bool? value = false;
  static const stepTitleFont = 16.0;
  var dropdownItems = ["item 1", "item 2", "item 3", "item 4"];
  @override
  void initState() {
    super.initState();
    valueChoose = dropdownItems[0];
  }

  void onChangeHandler(value) {
    setState(() {
      valueChoose = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          leadingTitle: 'Profile Settings',
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Theme(
                              data: ThemeData(
                                  colorScheme: const ColorScheme.light(
                                      primary: AppColors.fontDarkColor)),
                              child: Stepper(
                                physics: NeverScrollableScrollPhysics(),
                                currentStep: _index,
                                onStepCancel: () {
                                  if (_index > 0) {
                                    setState(() {
                                      _index -= 1;
                                    });
                                  }
                                },
                                onStepContinue: () {
                                  if (_index <= 2) {
                                    setState(() {
                                      _index += 1;
                                    });
                                  }
                                },
                                onStepTapped: (int index) {
                                  setState(() {
                                    _index = index;
                                  });
                                },
                                controlsBuilder: (BuildContext context,
                                    ControlsDetails details) {
                                  return _index < 3
                                      ? Row(
                                          children: <Widget>[
                                            CustomButton(
                                                title: 'Continue',
                                                color: AppColors.primaryColor,
                                                onPressed:
                                                    details.onStepContinue),
                                          ],
                                        )
                                      : const SizedBox.shrink();
                                },
                                steps: <Step>[
                                  Step(
                                      isActive: _index >= 0,
                                      title: const Text(
                                        'Expertise',
                                        style: TextStyle(
                                          fontSize: stepTitleFont,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.fontDarkColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      content: Container(
                                        height: 50,
                                        width: double.infinity,
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            CustomDropDown(
                                                dropDownHeight: 4,
                                                dropDownWidth: 25,
                                                onChangeHandler:
                                                    onChangeHandler,
                                                dropdownItems: dropdownItems,
                                                initialValue:
                                                    valueChoose.toString()),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            CustomDropDown(
                                                dropDownHeight: 4,
                                                dropDownWidth: 25,
                                                onChangeHandler:
                                                    onChangeHandler,
                                                dropdownItems: dropdownItems,
                                                initialValue:
                                                    valueChoose.toString()),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            SizedBox(
                                                child: CustomButton(
                                                    color:
                                                        AppColors.fontDarkColor,
                                                    fontColor:
                                                        AppColors.whiteColor,
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w600,
                                                    minSize: const Size(50, 35),
                                                    title: "Add",
                                                    onPressed: () {}
                                                    //  () => value.registerAPI(),
                                                    )),
                                          ],
                                        ),
                                      )),
                                  Step(
                                      isActive: _index >= 1,
                                      title: const Text(
                                        'Add Programmers',
                                        style: TextStyle(
                                          fontSize: stepTitleFont,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.fontDarkColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      content: Container(
                                        height: 80,
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(
                                              width: 140,
                                              height: 40,
                                              child: CustomTextFormField(
                                                isFilled: true,
                                                inputType: TextInputType
                                                    .visiblePassword,
                                                inputAction:
                                                    TextInputAction.done,
                                                hintText: "Add Programmers",
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 50),
                                              child: CustomButton(
                                                  color:
                                                      AppColors.fontDarkColor,
                                                  fontColor:
                                                      AppColors.whiteColor,
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w600,
                                                  minSize: const Size(70, 40),
                                                  title: "Add",
                                                  onPressed: () {}
                                                  //  () => value.registerAPI(),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Step(
                                      isActive: _index >= 2,
                                      title: const Text(
                                        'General Information',
                                        style: TextStyle(
                                          fontSize: stepTitleFont,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.fontDarkColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 130,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CheckboxListTile(
                                                value: value,
                                                contentPadding: EdgeInsets.zero,
                                                dense: true,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    value = newValue;
                                                  });
                                                },
                                                title: Transform.translate(
                                                  offset: const Offset(-12, 0),
                                                  child: Text(
                                                    'I accept email notifications',
                                                    style: TextStyle(
                                                      fontSize: 8.sp,
                                                      fontFamily:
                                                          AppConstants.textFont,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors
                                                          .fontDarkColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 11.0),
                                                child: CustomButton(
                                                    color:
                                                        AppColors.fontDarkColor,
                                                    fontColor:
                                                        AppColors.whiteColor,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w600,
                                                    minSize: const Size(50, 35),
                                                    title:
                                                        "Upload Profile Image",
                                                    onPressed: () {}
                                                    //  () => value.registerAPI(),
                                                    ),
                                              ),
                                            ]),
                                      )),
                                  Step(
                                    isActive: _index >= 3,
                                    title: const Text(
                                      'Change Password',
                                      style: TextStyle(
                                        fontSize: stepTitleFont,
                                        fontFamily: AppConstants.textFont,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.fontDarkColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    content: CustomButton(
                                        color: AppColors.fontDarkColor,
                                        fontColor: AppColors.whiteColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        minSize: Size(90.w, 35),
                                        title: "Change Password",
                                        onPressed: () {}
                                        //  () => value.registerAPI(),
                                        ),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Center(
                          child: CustomButton(
                              color: AppColors.primaryColor,
                              fontColor: AppColors.whiteColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              minSize: Size(100.w, 40),
                              title: "Submit",
                              onPressed: () {}
                              //  () => value.registerAPI(),
                              )),
                    ]))));
  }
}
