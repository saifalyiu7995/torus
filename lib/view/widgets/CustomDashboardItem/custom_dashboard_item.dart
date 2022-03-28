import 'package:flutter/material.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:tech_connect/utils/app/app_constant.dart';

class ItemsDashboard extends StatelessWidget {
  final String name;
  final String image;
  final Size size;

  const ItemsDashboard(
      {Key? key, required this.image, required this.name, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 15, bottom: 15, right: 15),
              height: 100,
              width: screenSize.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    const BoxShadow(
                        color: Color(0xffBECDE2),
                        offset: Offset(6, 6),
                        blurRadius: 8),
                    BoxShadow(
                        color: const Color(0xffF4F4F4).withOpacity(.2),
                        offset: const Offset(-6, -6),
                        blurRadius: 16),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: AppColors.fontColorDark,
                          fontFamily: AppConstants.textFont,
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 25,
              child: Image(
                height: size.height,
                width: size.width,
                image: AssetImage(image),
              ),
            ),
          ],
        ));
  }
}
