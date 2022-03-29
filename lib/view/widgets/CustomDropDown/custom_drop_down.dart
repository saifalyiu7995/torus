import 'package:flutter/material.dart';
import 'package:tech_connect/utils/app/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomDropDown extends StatelessWidget {
  final Function(String) onChangeHandler;
  final String initialValue;
  final List<String> dropdownItems;
  final double dropDownHeight;
  final double dropDownWidth;

  const CustomDropDown(
      {Key? key,
      required this.onChangeHandler,
      required this.dropdownItems,
      required this.initialValue,
      required this.dropDownHeight,
      required this.dropDownWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: dropDownHeight.h,
        width: dropDownWidth.w,
        //color: AppColors.primaryColor.withOpacity(0.7),
        padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
        decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.07),
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5)),
        //child: Text("dhaednwjidcksldk")
        child: DropdownButton(
          hint: const Text("Select Items:"),
          dropdownColor: AppColors.backgroundColor,
          value: initialValue,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.fontDarkColor,
          ),
          underline: Container(),
          iconSize: 30,
          isExpanded: true,
          onChanged: (newValue) => {onChangeHandler(newValue.toString())},
          items: dropdownItems.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(
                valueItem,
                style: const TextStyle(
                  color: AppColors.fontDarkColor,
                ),
              ),
            );
          }).toList(),
        ));
  }
}
