import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_connect/Routes/app_navigation.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final String leadingTitle;
  final String primaryScreenTitle;
  final double appBarHeight;
  final bool hideDivider;
  final String subTitle;

  const CustomAppBar(
      {Key? key,
      this.leading,
      this.actions,
      this.primaryScreenTitle = '',
      this.leadingTitle = '',
      this.hideDivider = false,
      this.subTitle = '',
      this.appBarHeight = 65.0})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        leading: AppNavigation.canPop(context)
            ? IconButton(
                onPressed: () => AppNavigation.goBack(),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 2.h,
                  color: AppColors.fontDarkColor,
                ))
            : leading,
        titleSpacing: AppNavigation.canPop(context) ? 0 : 16,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: leadingTitle.isNotEmpty ? '$leadingTitle ' : '',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: AppConstants.textFont,
                      color: AppColors.fontDarkColor)),
              TextSpan(
                  text: primaryScreenTitle,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.fontDarkColor))
            ])),
            if (subTitle.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: AutoSizeText(
                  subTitle,
                  style: TextStyle(
                      fontSize: 11.sp, color: AppColors.fontDarkColor),
                ),
              ),
          ],
        ),
        bottom: hideDivider
            ? null
            : const PreferredSize(
                preferredSize: Size.fromHeight(10.0),
                child: Divider(height: 10)),
        actions: actions ??
            [
              //   IconButton(
              //       onPressed: () {},
              //       icon: SvgPicture.asset(
              //         "${AppConstants.assetIcons}search.svg",
              //         color: AppColors.fontColorDark,
              //         height: 15,
              //       ))
            ]);
  }
}
