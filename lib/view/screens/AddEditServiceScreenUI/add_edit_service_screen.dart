// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/view/widgets/CustomAppbar/custom_appbar.dart';
import 'package:tech_connect/view/widgets/CustomButton/custom_button.dart';
import 'package:tech_connect/view/widgets/CustomDropDown/custom_drop_down.dart';
import 'package:tech_connect/view/widgets/CustomTextFormField/custom_text_form_field.dart';
import '../../../utils/app/app_constant.dart';

class AddEditServiceScreen extends StatefulWidget {
  const AddEditServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddEditServiceScreen> createState() => _AddEditServiceScreenState();
}

class _AddEditServiceScreenState extends State<AddEditServiceScreen> {
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
          leadingTitle: 'Add Service',
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
                                  if (_index <= 5) {
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
                                  return _index < 5
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
                                        'Vehicle Control Module',
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
                                                dropDownHeight: 5,
                                                dropDownWidth: 50,
                                                onChangeHandler:
                                                    onChangeHandler,
                                                dropdownItems: dropdownItems,
                                                initialValue:
                                                    valueChoose.toString()),
                                          ],
                                        ),
                                      )),
                                  Step(
                                      isActive: _index >= 1,
                                      title: const Text(
                                        'Car Model',
                                        style: TextStyle(
                                          fontSize: stepTitleFont,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.fontDarkColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      content: Container(
                                        height: 25.h,
                                        width: double.infinity,
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CustomDropDown(
                                                dropDownHeight: 5,
                                                dropDownWidth: 40,
                                                onChangeHandler:
                                                    onChangeHandler,
                                                dropdownItems: dropdownItems,
                                                initialValue:
                                                    valueChoose.toString()),
                                            SizedBox(height: 1.h),
                                            CustomDropDown(
                                                dropDownHeight: 5,
                                                dropDownWidth: 40,
                                                onChangeHandler:
                                                    onChangeHandler,
                                                dropdownItems: dropdownItems,
                                                initialValue:
                                                    valueChoose.toString()),
                                            SizedBox(height: 1.h),
                                            CustomDropDown(
                                                dropDownHeight: 5,
                                                dropDownWidth: 40,
                                                onChangeHandler:
                                                    onChangeHandler,
                                                dropdownItems: dropdownItems,
                                                initialValue:
                                                    valueChoose.toString()),
                                            SizedBox(height: 1.h),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 200.0),
                                              child: CustomButton(
                                                  color:
                                                      AppColors.fontDarkColor,
                                                  fontColor:
                                                      AppColors.whiteColor,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600,
                                                  minSize: const Size(80, 40),
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
                                        'Part Numbers',
                                        style: TextStyle(
                                          fontSize: stepTitleFont,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.fontDarkColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      content: Container(
                                        height: 10.h,
                                        width: double.infinity,
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10.h,
                                                width: 50.w,
                                                child: CustomTextFormField(
                                                  hintFont: 10.sp,
                                                  padding: EdgeInsets.all(2),
                                                  isFilled: true,
                                                  inputType: TextInputType
                                                      .visiblePassword,
                                                  inputAction:
                                                      TextInputAction.done,
                                                  hintText: "Add Part Number",
                                                ),
                                              ),
                                              SizedBox(height: 1.h),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 11.0, bottom: 11.0),
                                                child: CustomButton(
                                                    color:
                                                        AppColors.fontDarkColor,
                                                    fontColor:
                                                        AppColors.whiteColor,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w600,
                                                    minSize: const Size(80, 40),
                                                    title: "Add",
                                                    onPressed: () {}
                                                    //  () => value.registerAPI(),
                                                    ),
                                              ),
                                            ]),
                                      )),
                                  Step(
                                      isActive: _index >= 3,
                                      title: const Text(
                                        'Symptoms',
                                        style: TextStyle(
                                          fontSize: stepTitleFont,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.fontDarkColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      content: Container(
                                        height: 10.h,
                                        width: double.infinity,
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10.h,
                                                width: 50.w,
                                                child: CustomTextFormField(
                                                  hintFont: 10.sp,
                                                  padding: EdgeInsets.all(2),
                                                  isFilled: true,
                                                  inputType: TextInputType
                                                      .visiblePassword,
                                                  inputAction:
                                                      TextInputAction.done,
                                                  hintText: "Add Symptom",
                                                ),
                                              ),
                                              SizedBox(height: 1.h),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 11.0, bottom: 11.0),
                                                child: CustomButton(
                                                    color:
                                                        AppColors.fontDarkColor,
                                                    fontColor:
                                                        AppColors.whiteColor,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w600,
                                                    minSize: const Size(80, 40),
                                                    title: "Add",
                                                    onPressed: () {}
                                                    //  () => value.registerAPI(),
                                                    ),
                                              ),
                                            ]),
                                      )),
                                  Step(
                                      isActive: _index >= 4,
                                      title: const Text(
                                        'Required Programmers',
                                        style: TextStyle(
                                          fontSize: stepTitleFont,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.fontDarkColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      content: Container(
                                        height: 20.h,
                                        width: double.infinity,
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CustomDropDown(
                                                dropDownHeight: 5,
                                                dropDownWidth: 40,
                                                onChangeHandler:
                                                    onChangeHandler,
                                                dropdownItems: dropdownItems,
                                                initialValue:
                                                    valueChoose.toString()),
                                            SizedBox(height: 1.h),
                                            CustomDropDown(
                                                dropDownHeight: 5,
                                                dropDownWidth: 40,
                                                onChangeHandler:
                                                    onChangeHandler,
                                                dropdownItems: dropdownItems,
                                                initialValue:
                                                    valueChoose.toString()),
                                            SizedBox(height: 1.h),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 200.0),
                                              child: CustomButton(
                                                  color:
                                                      AppColors.fontDarkColor,
                                                  fontColor:
                                                      AppColors.whiteColor,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600,
                                                  minSize: const Size(80, 40),
                                                  title: "Add",
                                                  onPressed: () {}
                                                  //  () => value.registerAPI(),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Step(
                                      isActive: _index >= 5,
                                      title: const Text(
                                        'Service Details',
                                        style: TextStyle(
                                          fontSize: stepTitleFont,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.fontDarkColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      content: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 5.h,
                                                          width: 30.w,
                                                          child:
                                                              const CustomTextFormField(
                                                            hintFont: 10.0,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            isFilled: true,
                                                            inputType: TextInputType
                                                                .visiblePassword,
                                                            inputAction:
                                                                TextInputAction
                                                                    .done,
                                                            hintText: "Title",
                                                          ),
                                                        ),
                                                        SizedBox(height: 1.h),
                                                        SizedBox(
                                                          height: 5.h,
                                                          width: 30.w,
                                                          child: const CustomTextFormField(
                                                              hintFont: 10.0,
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      2),
                                                              isFilled: true,
                                                              inputType:
                                                                  TextInputType
                                                                      .visiblePassword,
                                                              inputAction:
                                                                  TextInputAction
                                                                      .done,
                                                              hintText: "Time"),
                                                        ),
                                                        SizedBox(height: 1.h),
                                                        SizedBox(
                                                          height: 5.h,
                                                          width: 30.w,
                                                          child:
                                                              const CustomTextFormField(
                                                            hintFont: 10.0,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            isFilled: true,
                                                            inputType: TextInputType
                                                                .visiblePassword,
                                                            inputAction:
                                                                TextInputAction
                                                                    .done,
                                                            hintText: "Price",
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 5.h,
                                                          width: 40.w,
                                                          child:
                                                              const CustomTextFormField(
                                                            hintFont: 10.0,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            isFilled: true,
                                                            inputType: TextInputType
                                                                .visiblePassword,
                                                            inputAction:
                                                                TextInputAction
                                                                    .done,
                                                            hintText:
                                                                "Description",
                                                          ),
                                                        ),
                                                        SizedBox(height: 1.h),
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 11.0, bottom: 11.0),
                                              child: CustomButton(
                                                  color:
                                                      AppColors.fontDarkColor,
                                                  fontColor:
                                                      AppColors.whiteColor,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600,
                                                  minSize: const Size(75, 35),
                                                  title: "Upload Images",
                                                  onPressed: () {}
                                                  //  () => value.registerAPI(),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )),
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
