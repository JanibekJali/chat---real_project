import 'package:flutter/material.dart';
import 'package:real_project/app/app_constants/colors/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final double? buttonVer;
  final double? buttonHor;
  final void Function()? onTap;
  const CustomButtonWidget({
    required this.buttonText,
    required this.buttonTextStyle,
    required this.onTap,
    this.buttonVer = 12,
    this.buttonHor = 58,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: buttonVer!,
            horizontal: buttonHor!,
          ),
          child: Text(
            buttonText!,
            style: buttonTextStyle!,
          ),
        ),
      ),
    );
  }
}
