import 'package:flutter/material.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/Routes/app_navigation_routes.dart';
import 'package:tech_connect/provider/Auth/auth_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  final bool? isDashboard;
  const DrawerWidget({this.isDashboard});
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      decoration: const BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "MENU",
                style: TextStyle(
                    color: AppColors.fontColorDark,
                    fontFamily: AppConstants.textFont,
                    fontWeight: FontWeight.w800,
                    fontSize:
                        MediaQuery.of(context).size.height < 600 ? 20 : 28),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height < 600
                  ? MediaQuery.of(context).size.height * 0.05
                  : MediaQuery.of(context).size.height * 0.1,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppConstants.textFont,
                      fontWeight: FontWeight.w800,
                      fontSize:
                          MediaQuery.of(context).size.height < 600 ? 16 : 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
                bottom: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 0.5,
                child: Container(
                  color: AppColors.fontColorDark,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "My Jobs",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppConstants.textFont,
                      fontWeight: FontWeight.w800,
                      fontSize:
                          MediaQuery.of(context).size.height < 600 ? 16 : 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
                bottom: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 0.5,
                child: Container(
                  color: AppColors.fontColorDark,
                ),
              ),
            ),
            InkWell(
              onTap: () => AppNavigation.navigateTo(
                  AppNavRoutes.profileSettingScreenRoute),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Profile Settings",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppConstants.textFont,
                      fontWeight: FontWeight.w800,
                      fontSize:
                          MediaQuery.of(context).size.height < 600 ? 16 : 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
                bottom: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 0.5,
                child: Container(
                  color: AppColors.fontColorDark,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AppNavigation.navigateTo(AppNavRoutes.myServicesScreenRoute);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "My Service",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppConstants.textFont,
                      fontWeight: FontWeight.w800,
                      fontSize:
                          MediaQuery.of(context).size.height < 600 ? 16 : 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
                bottom: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 0.5,
                child: Container(
                  color: AppColors.fontColorDark,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Request",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppConstants.textFont,
                      fontWeight: FontWeight.w800,
                      fontSize:
                          MediaQuery.of(context).size.height < 600 ? 16 : 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
                bottom: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 0.5,
                child: Container(
                  color: AppColors.fontColorDark,
                ),
              ),
            ),
            Consumer<AuthProvider>(
              builder: (context, value, child) => InkWell(
                onTap: () {
                  value.signOutGoogle();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "LOGOUT",
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontFamily: AppConstants.textFont,
                        fontWeight: FontWeight.w800,
                        fontSize:
                            MediaQuery.of(context).size.height < 600 ? 16 : 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
                bottom: MediaQuery.of(context).size.height < 600 ? 10 : 20.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 1,
                child: Container(
                  color: AppColors.fontColorDark,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "All rights Reserved by TECH CONNECT",
                style: TextStyle(
                    color: Color(0xffC7C7C7),
                    fontFamily: "on-regular",
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
