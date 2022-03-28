import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/provider/Splash/splash_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  _SplashScreenUIState createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<SplashProvider>(context, listen: false).splashInit(this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.1),
        child: Column(
          children: [
            Consumer<SplashProvider>(builder: (context, value, child) {
              return AnimatedBuilder(
                  builder: (BuildContext context, Widget? child) =>
                      Transform.translate(
                          offset: Offset(0, 250 * value.controller.value),
                          child: Center(
                              child: Image(
                            image: const AssetImage(
                                '${AppConstants.assetImages}logo.png'),
                            height: 10.h,
                            width: 80.w,
                          ))),
                  animation: value.controller);
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
