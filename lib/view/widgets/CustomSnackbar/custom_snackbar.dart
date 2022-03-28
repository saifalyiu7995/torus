import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';

dynamic customSnackBar(String message) =>
    ScaffoldMessenger.of(AppNavigation.currentContext).showSnackBar(SnackBar(
      content: SizedBox(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('${AppConstants.assetIcons}checked.svg',
                height: 35, width: 35, fit: BoxFit.fitWidth),
            SizedBox(
              width: 220,
              child: AutoSizeText(
                message,
                minFontSize: 10,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontFamily: AppConstants.textFont),
              ),
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(8)),
      backgroundColor: AppColors.secondaryColor,
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      duration: const Duration(seconds: 2),
    ));

dynamic showSnackBar(String message, {Color? color}) =>
    ScaffoldMessenger.of(AppNavigation.currentContext).showSnackBar(SnackBar(
      content: Text(message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.whiteColor)),
      backgroundColor: color ?? const Color.fromRGBO(245, 104, 123, 1),
      duration: const Duration(seconds: 2),
    ));
