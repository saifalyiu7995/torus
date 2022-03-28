import 'package:flutter/material.dart';
import 'package:tech_connect/Routes/app_navigation_routes.dart';

class AppNavigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushReplacementTo(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushAndKillAll(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(AppNavRoutes.initialRoute));
  }

  static void removeAllRoutes() =>
      navigatorKey.currentState!.popUntil((route) => route.isFirst);

  static goBack() {
    return navigatorKey.currentState!.pop();
  }

  static bool canPop(BuildContext context) {
    return ModalRoute.of(context)!.canPop;
  }

  static BuildContext get currentContext =>
      navigatorKey.currentState!.overlay!.context;
}
