import 'package:flutter/material.dart';
import 'package:tech_connect/view/screens/AuthScreenUI/auth_screen_ui.dart';
import 'package:tech_connect/view/screens/ChangePassword/change_password_screen.dart';
import 'package:tech_connect/view/screens/DashboardScreenUI/dashboard.dart';
import 'package:tech_connect/view/screens/ForgetPasswordScreenUI/forget_password_screen.dart';
import 'package:tech_connect/view/screens/MyServices/my_services_screen.dart';
import 'package:tech_connect/view/screens/OTP/otp_screen.dart';
import 'package:tech_connect/view/screens/ProfileSettingUI/profile_setting_screen.dart';
import 'package:tech_connect/view/screens/RegisterOptions/register_option_screen.dart';
import 'package:tech_connect/view/screens/RegisterScreenUI/register_screen.dart';
import 'package:tech_connect/view/screens/SplashScreen/splash_screen.dart';
import 'package:tech_connect/view/widgets/CustomAppbar/custom_appbar.dart';
import '../view/screens/AddEditServiceScreenUI/add_edit_service_screen.dart';
import 'app_navigation_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppNavRoutes.initialRoute:
        return routeScreen(child: const SplashScreenUI());
      case AppNavRoutes.authRoute:
        return routeScreen(child: const AuthScreenUI());
      case AppNavRoutes.forgetPasswordRoute:
        return routeScreen(child: const ForgetPasswordScreen());
      case AppNavRoutes.registerRoute:
        return routeScreen(child: const RegisterScreen());
      case AppNavRoutes.dashboardRoute:
        return routeScreen(child: const DashboardScreenUI());
      case AppNavRoutes.registerOptionRoute:
        return routeScreen(child: const RegisterOptionScreen());
      case AppNavRoutes.changePasswordRoute:
        return routeScreen(child: const ChangePasswordScreen());
      case AppNavRoutes.otpRoute:
        return routeScreen(child: const OTPScreen());
      case AppNavRoutes.profileSettingScreenRoute:
        return routeScreen(child: const ProfileSettingScreen());
      case AppNavRoutes.addEditServiceScreenRoute:
        return routeScreen(child: const AddEditServiceScreen());
      case AppNavRoutes.myServicesScreenRoute:
        return routeScreen(child: const MyServicesUI());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        appBar: CustomAppBar(primaryScreenTitle: 'Error'),
        body: Center(child: Text('ERROR')),
      );
    });
  }

  static Route<dynamic> routeScreen({Widget? child}) {
    return MaterialPageRoute(builder: (context) => child!);
  }
}
