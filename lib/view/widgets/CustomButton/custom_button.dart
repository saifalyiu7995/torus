import 'package:flutter/material.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Size? minSize;
  final VoidCallback? onPressed;

  const CustomButton(
      {Key? key,
      this.color,
      this.fontColor,
      this.fontSize,
      this.fontWeight,
      this.minSize,
      this.onPressed,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color ?? AppColors.blueColorForgetPassword,
          minimumSize: minSize),
      child: Text(
        title!,
        style: TextStyle(
            color: fontColor,
            fontFamily: AppConstants.textFont,
            fontSize: fontSize,
            fontWeight: fontWeight),
      ),
    );
  }
}
