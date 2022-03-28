import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/provider/Auth/auth_provider.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';
import 'package:tech_connect/view/widgets/CustomAppbar/custom_appbar.dart';
import 'package:tech_connect/view/widgets/CustomDashboardItem/custom_dashboard_item.dart';
import 'package:tech_connect/view/widgets/CustomDrawer/drawer.dart';

class DashboardScreenUI extends StatefulWidget {
  const DashboardScreenUI({Key? key}) : super(key: key);

  @override
  _DashboardScreenUIState createState() => _DashboardScreenUIState();
}

class _DashboardScreenUIState extends State<DashboardScreenUI> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => Scaffold(
          key: scaffoldKey,
          drawer: const DrawerWidget(),
          appBar: CustomAppBar(
            leadingTitle: 'Tech Connect',
            leading: GestureDetector(
              onTap: () => scaffoldKey.currentState!.openDrawer(),
              child: const Icon(
                Icons.menu,
                color: AppColors.fontDarkColor,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.notifications,
                  color: AppColors.fontDarkColor,
                ),
              ),
            ],
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 240,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          const BoxShadow(
                              color: Color(0xffBECDE2),
                              offset: Offset(6, 6),
                              blurRadius: 16),
                          BoxShadow(
                              color: const Color(0xffF4F4F4).withOpacity(.2),
                              offset: const Offset(-6, -6),
                              blurRadius: 16),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 75,
                          width: 75,
                          child: authProvider.user != null
                              ? GoogleUserCircleAvatar(
                                  identity: authProvider.user!)
                              : CircleAvatar(
                                  backgroundImage:
                                      NetworkImage('${authProvider.userImage}'),
                                ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          authProvider.user != null
                              ? '${authProvider.user!.displayName}'
                              : '${authProvider.userName}',
                          style: const TextStyle(
                              color: AppColors.fontDarkColor,
                              fontFamily: AppConstants.textFont,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontSize: 22),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Completed",
                                      style: TextStyle(
                                          color: AppColors.greenFontColor,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const Text(
                                      "17",
                                      style: TextStyle(
                                          color: AppColors.fontDarkColor,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      "New",
                                      style: TextStyle(
                                          color:
                                              AppColors.blueColorForgetPassword,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const Text(
                                      "6",
                                      style: TextStyle(
                                          color: AppColors.fontDarkColor,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 14.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Cancelled",
                                      style: TextStyle(
                                          color: AppColors.valuesRedColors,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const Text(
                                      "13",
                                      style: TextStyle(
                                          color: AppColors.fontDarkColor,
                                          fontFamily: AppConstants.textFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ItemsDashboard(
                        name: "Search Service",
                        image: '${AppConstants.assetImages}searchservice.png',
                        size: Size(95, 95),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ItemsDashboard(
                        name: "Search Job",
                        image: '${AppConstants.assetImages}job-search.png',
                        size: Size(85, 85),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ItemsDashboard(
                        name: "Add Service",
                        image: '${AppConstants.assetImages}mechanic.png',
                        size: Size(85, 85),
                      ),
                    )
                  ],
                )
              ],
            ),
          ))),
    );
  }
}
