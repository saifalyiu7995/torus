import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/provider/app_providers.dart';
import 'package:tech_connect/utils/app/app_theme.dart';
import 'package:tech_connect/utils/app/helper_functions.dart';

import 'Routes/app_navigation_routes.dart';
import 'routes/route_generator.dart';

void main() {
  HelperFunction.mainInitializer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: appProviders,
        child: AdaptiveTheme(
          light: AppThemes.lightTheme,
          dark: AppThemes.darkTheme,
          initial: AdaptiveThemeMode.dark,
          builder: (theme, darkTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Tech Connect',
              theme: theme,
              darkTheme: darkTheme,
              initialRoute: AppNavRoutes.initialRoute,
              navigatorKey: AppNavigation.navigatorKey,
              onGenerateRoute: RouteGenerator.generateRoute),
        ),
      );
    });
  }
}
