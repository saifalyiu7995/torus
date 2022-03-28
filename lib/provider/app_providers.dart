import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tech_connect/provider/Auth/auth_provider.dart';
import 'package:tech_connect/provider/ChangePassword/change_password_provider.dart';
import 'package:tech_connect/provider/ForgetPassword/forget_password_provider.dart';
import 'package:tech_connect/provider/OTP/op_provider.dart';
import 'package:tech_connect/provider/Register/register_provider.dart';
import 'package:tech_connect/provider/Splash/splash_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
  ChangeNotifierProvider(create: (_) => ForgetProvider()),
  ChangeNotifierProvider(create: (_) => RegisterProvider()),
  ChangeNotifierProvider(create: (_) => SplashProvider()),
  ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
  ChangeNotifierProvider(create: (_) => OTPProvider()),
];
