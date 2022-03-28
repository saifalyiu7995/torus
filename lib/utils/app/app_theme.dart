import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_connect/utils/app/app_constant.dart';

import 'dart:io';
import 'app_colors.dart';

class AppThemes {
  /// Dark Theme Settings
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: AppColors.appThemeColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      unselectedWidgetColor: AppColors.fontColorDark,
      canvasColor: Colors.transparent,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.fontColorDark),
      tabBarTheme: const TabBarTheme(
          labelColor: AppColors.navBarSelectedColor,
          unselectedLabelColor: AppColors.fontColorDark),
      inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none, hintStyle: TextStyle(fontSize: 12)),
      appBarTheme: AppBarTheme(
          color: AppColors.secondaryColor,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness:
                  Platform.isIOS ? Brightness.dark : Brightness.light,
              statusBarIconBrightness:
                  Platform.isIOS ? Brightness.dark : Brightness.dark,
              statusBarColor: AppColors.secondaryColor)),
      primaryColor: AppColors.primaryColor,
      fontFamily: AppConstants.textFont);

  /// Light Theme Settings
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
        color: AppColors.secondaryColor,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.blue)),
  );
}
