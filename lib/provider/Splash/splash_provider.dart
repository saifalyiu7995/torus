import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/provider/Auth/auth_provider.dart';

class SplashProvider extends ChangeNotifier {
  late final AnimationController _controller;

  AnimationController get controller => _controller;

  splashInit(ctx) {
    _controller = AnimationController(
        vsync: ctx, duration: const Duration(milliseconds: 1500));
    _controller.forward();

    Timer(
      const Duration(milliseconds: 2500),
      () {
        Provider.of<AuthProvider>(AppNavigation.currentContext, listen: false)
            .googleSignInInit();

        _controller.dispose();
      },
    );
  }
}
