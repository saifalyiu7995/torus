import 'package:flutter/material.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/view/widgets/CustomLoader/custom_loading_widget.dart';

class DialogBuilder {
  static showLoadingIndicator() => showDialog(
      context: AppNavigation.currentContext,
      barrierDismissible: false,
      builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false, child: const CustomLoadingWidget()));

  // static fingerprintDialog() => showDialog(
  //     context: AppNavigation.currentContext,
  //     builder: (_) => AlertDialog(
  //           backgroundColor: AppColors.sortByBackgroundColor,
  //           title: const Text('Fingerprint Registration'),
  //           content: const Text('Do you want to register your fingerprint?'),
  //           actions: [
  //             CustomButton(
  //               color: AppColors.valuesRedColors,
  //               onPressed: () => AppNavigation.goBack(),
  //               title: 'CANCEL',
  //             ),
  //             CustomButton(
  //               color: AppColors.blueColorLoginButton,
  //               onPressed: () {
  //                 AppNavigation.pushReplacementTo(
  //                     AppNavRoutes.fingerprintRegistrationRoute);
  //               },
  //               title: 'OK',
  //             ),
  //           ],
  //         ));

  static void hideOpenDialog() => AppNavigation.goBack();
}
