import 'package:flutter/material.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';

class CustomTextFormField extends StatelessWidget {
  final String? leadingIcon;
  final String hintText;
  final bool isEnable, obscureText;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FocusNode? node;
  final Function? onFieldSubmit, onChange;
  final TextInputAction? inputAction;
  final bool? readOnly, isFilled;
  final Function()? onTap;
  final EdgeInsets? padding;

  final double? borderRadius;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final double borderWidth;
  final double hintFont;
  final int maxLength;
  final Widget? suffixWidget;
  final double? suffixPadding;
  final String textFormTitle;
  final double textFormTitleFont;
  final double titleFormPadding;
  final IconData? iconData;

  const CustomTextFormField(
      {Key? key,
      this.leadingIcon = "",
      this.hintText = "",
      this.obscureText = false,
      this.isEnable = true,
      this.inputType,
      this.isFilled = false,
      this.controller,
      this.node,
      this.validator,
      this.onFieldSubmit,
      this.onChange,
      this.inputAction,
      this.readOnly = false,
      this.onTap,
      this.maxLength = 256,
      this.padding,
      this.autoValidateMode,
      this.borderRadius,
      this.hintFont = 14.0,
      this.suffixWidget,
      this.suffixPadding = 0.0,
      this.textFormTitle = '',
      this.textFormTitleFont = 14.0,
      this.titleFormPadding = 0.0,
      this.iconData,
      this.borderWidth = 0.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (textFormTitle.isNotEmpty)
          Padding(
              padding: EdgeInsets.symmetric(vertical: titleFormPadding),
              child: Text(textFormTitle,
                  style: TextStyle(
                      fontSize: textFormTitleFont,
                      fontFamily: AppConstants.textFont,
                      fontWeight: FontWeight.bold,
                      color: AppColors.fontDarkColor))),
        Flexible(
          flex: textFormTitle.isNotEmpty ? 0 : 1,
          child: TextFormField(
            cursorColor: AppColors.fontDarkColor,
            autovalidateMode: autoValidateMode,
            autofocus: true,
            keyboardType: inputType ?? TextInputType.name,
            obscureText: obscureText,
            textInputAction: inputAction ?? TextInputAction.next,
            onFieldSubmitted: (value) => onFieldSubmit,
            controller: controller,
            focusNode: node,
            onTap: onTap,
            readOnly: readOnly!,
            maxLength: maxLength,
            style: const TextStyle(
                fontFamily: AppConstants.textFont,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
                color: AppColors.fontDarkColor),
            decoration: InputDecoration(
                counter: const SizedBox.shrink(),
                fillColor: AppColors.primaryColor.withOpacity(0.07),
                filled: isFilled,
                suffixIcon: Padding(
                    padding: EdgeInsets.all(suffixPadding!),
                    child: suffixWidget),
                prefixIcon: iconData != null
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          iconData,
                          color: AppColors.fontDarkColor,
                          size: 22,
                        ))
                    : null,
                contentPadding:
                    padding ?? const EdgeInsets.only(left: 15, right: 15),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius ?? 2)),
                    borderSide: BorderSide(
                        width: borderWidth, color: AppColors.fontDarkColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius ?? 2)),
                    borderSide: BorderSide(
                        width: borderWidth, color: AppColors.fontDarkColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius ?? 2)),
                    borderSide: BorderSide(
                        width: borderWidth, color: AppColors.fontDarkColor)),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: hintFont,
                  color: AppColors.fontDarkColor,
                )),
            validator: validator,
            onChanged: (value) => onChange,
            onSaved: (newValue) => controller!.text,
          ),
        ),
      ],
    );
  }
}
