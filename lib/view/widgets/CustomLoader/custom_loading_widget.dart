import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_connect/utils/app/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const Opacity(
          opacity: 0.2,
          child: ModalBarrier(dismissible: false, color: Colors.black)),
      Center(
        child: SpinKitWave(
          size: 30,
          itemBuilder: (BuildContext context, int index) {
            return const DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
              ),
            );
          },
        ),
      )
    ]);
  }
}
