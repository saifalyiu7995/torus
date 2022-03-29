import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/provider/Register/register_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';
import 'package:tech_connect/view/widgets/CustomAppbar/custom_appbar.dart';
import 'package:tech_connect/view/widgets/CustomButton/custom_button.dart';
import 'package:tech_connect/view/widgets/CustomTextFormField/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    Provider.of<RegisterProvider>(context, listen: false).registerInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppBar(
          leadingTitle: 'Register',
        ),
        body: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Consumer<RegisterProvider>(
                  builder: (context, value, child) => Form(
                    key: value.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                            textFormTitle: "First Name",
                            isFilled: true,
                            maxLength: 30,
                            controller: value.firstNameController,
                            inputType: TextInputType.visiblePassword,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) => value.nameValidator(
                                value: v, title: "First Name"),
                            hintText: "First Name",
                            iconData: Icons.person_rounded,
                            obscureText: false),
                        CustomTextFormField(
                            textFormTitle: "Last Name",
                            isFilled: true,
                            maxLength: 30,
                            controller: value.lastNameController,
                            inputType: TextInputType.visiblePassword,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) => value.nameValidator(
                                value: v, title: "Last Name"),
                            hintText: "Last Name",
                            iconData: Icons.person_rounded,
                            obscureText: false),

                        CustomTextFormField(
                            textFormTitle: "Contact",
                            isFilled: true,
                            controller: value.contactController,
                            inputType: TextInputType.number,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLength: 15,
                            validator: (v) => value.contactValidator(
                                value: v, title: "Contact"),
                            hintText: "Contact",
                            iconData: Icons.phone_android_rounded,
                            obscureText: false),
                        CustomTextFormField(
                            textFormTitle: "Email",
                            isFilled: true,
                            controller: value.emailController,
                            inputType: TextInputType.visiblePassword,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) => value.emailValidator(
                                  value: v,
                                ),
                            hintText: "Email",
                            obscureText: false),
                        CustomTextFormField(
                            textFormTitle: "Company Name",
                            isFilled: true,
                            maxLength: 30,
                            controller: value.companyController,
                            inputType: TextInputType.visiblePassword,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) => value.companyNameValidator(
                                value: v, title: "Company Name"),
                            hintText: "Company Name",
                            iconData: Icons.person_rounded,
                            obscureText: false),
                        const Text("Country",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.textFont,
                                fontWeight: FontWeight.bold,
                                color: AppColors.fontDarkColor)),
                        DropdownSearch<String>(
                            mode: Mode.DIALOG,
                            showSearchBox: true,
                            showSelectedItems: true,
                            searchFieldProps: TextFieldProps(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: AppColors.fontDarkColor)),
                                    hintText: "Search Country Name")),
                            items: AppConstants.countries
                                .map<String>((e) => e['name'])
                                .toList(),
                            dropdownBuilder: (_, val) => Text(
                                  val!,
                                  style: const TextStyle(
                                      color: AppColors.fontDarkColor,
                                      fontSize: 16),
                                ),
                            dropDownButton: const Icon(
                              Icons.arrow_drop_down_rounded,
                              color: AppColors.fontDarkColor,
                              size: 28,
                            ),
                            popupBackgroundColor: AppColors.primaryColor,
                            dropdownSearchDecoration: InputDecoration(
                                iconColor: AppColors.fontDarkColor,
                                suffixIconColor: AppColors.fontDarkColor,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                fillColor:
                                    AppColors.primaryColor.withOpacity(0.07),
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.fontDarkColor)),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        width: 0.3,
                                        color: AppColors.fontDarkColor)),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.fontDarkColor)),
                                hintText: 'Country',
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.fontDarkColor,
                                )),
                            onChanged: (newValue) {
                              value.setDropDown(value: newValue);
                            },
                            selectedItem: value.dropDownValue),
                        const SizedBox(
                          height: 20,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 20.0),
                        //   child: DropdownButtonFormField<dynamic>(
                        //       dropdownColor: AppColors.secondaryColor,
                        //       value: value.dropDownValue,
                        //       isDense: true,
                        //       isExpanded: true,
                        //       icon: const Icon(
                        //         Icons.arrow_drop_down_rounded,
                        //         color: AppColors.fontDarkColor,
                        //         size: 28,
                        //       ),
                        //       decoration: InputDecoration(
                        //           contentPadding: const EdgeInsets.symmetric(
                        //               horizontal: 15),
                        //           fillColor:
                        //               AppColors.primaryColor.withOpacity(0.07),
                        //           filled: true,
                        //           border: const OutlineInputBorder(
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5)),
                        //               borderSide: BorderSide(
                        //                   width: 1,
                        //                   color: AppColors.fontDarkColor)),
                        //           enabledBorder: const OutlineInputBorder(
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5)),
                        //               borderSide: BorderSide(
                        //                   width: 0.3,
                        //                   color: AppColors.fontDarkColor)),
                        //           focusedBorder: const OutlineInputBorder(
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5)),
                        //               borderSide: BorderSide(
                        //                   width: 1,
                        //                   color: AppColors.fontDarkColor)),
                        //           hintText: 'Country',
                        //           hintStyle: const TextStyle(
                        //             fontSize: 14,
                        //             color: AppColors.fontDarkColor,
                        //           )),
                        //       items: AppConstants.countries.map((e) {
                        //         return DropdownMenuItem(
                        //             value: e['name'],
                        //             child: SizedBox(
                        //                 width: 200,
                        //                 child: AutoSizeText(
                        //                   e['name'],
                        //                   minFontSize: 8,
                        //                   style: const TextStyle(
                        //                       color: AppColors.fontDarkColor,
                        //                       fontSize: 14),
                        //                 )));
                        //       }).toList(),
                        //       onChanged: (newValue) {
                        //         value.setDropDown(value: newValue);
                        //       }),
                        // ),
                        // CustomTextFormField(
                        //     textFormTitle: "Country",
                        //     isFilled: true,
                        //     controller: value.countryController,
                        //     inputType: TextInputType.visiblePassword,
                        //     autoValidateMode:
                        //         AutovalidateMode.onUserInteraction,
                        //     validator: (v) =>
                        //         value.nameValidator(value: v, title: "Country"),
                        //     hintText: "Country",
                        //     iconData: Icons.maps_home_work_rounded,
                        //     obscureText: false),

                        CustomTextFormField(
                            textFormTitle: "Password",
                            isFilled: true,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: value.passwordController,
                            inputType: TextInputType.visiblePassword,
                            inputAction: TextInputAction.next,
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
                        CustomTextFormField(
                            textFormTitle: "Confirm Password",
                            isFilled: true,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: value.confirmPasswordController,
                            inputType: TextInputType.visiblePassword,
                            inputAction: TextInputAction.done,
                            validator: (v) =>
                                value.confirmPasswordValidator(value: v),
                            hintText: "Confirm Password",
                            suffixWidget: InkWell(
                              onTap: () => value.showHideConfirmPassword(),
                              child: Icon(
                                !value.obscureTextConfirm
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.fontDarkColor,
                              ),
                            ),
                            iconData: Icons.lock,
                            obscureText: value.obscureTextConfirm),
                        Center(
                            child: CustomButton(
                          color: AppColors.primaryColor,
                          fontColor: AppColors.whiteColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          minSize: Size(100.w, 5.h),
                          title: "Register",
                          onPressed: () => value.registerAPI(
                              company: value.companyController.text,
                              contact: value.contactController.text,
                              country: value.dropDownValue,
                              email: value.emailController.text,
                              firstName: value.firstNameController.text,
                              lastName: value.lastNameController.text,
                              password: value.confirmPasswordController.text),
                        )),

                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
