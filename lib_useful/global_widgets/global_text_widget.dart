import 'package:flutter/material.dart';
import 'package:real_project/app/app_constants/colors/app_colors.dart';
import 'package:real_project/app/app_constants/text_styles/app_text_styles.dart';

class GlobalTextWidget extends StatelessWidget {
  final String? text;
  TextStyle? textStyle;
  Color? textColor;
  bool? isCentered;
  int? maxLine;
  bool? islongTxt;
  GlobalTextWidget(
      {this.text,
      this.textColor,
      this.isCentered,
      this.islongTxt,
      this.maxLine,
      this.textStyle});
  @override
  Widget build(BuildContext context) {
    if (textStyle == null) textStyle = AppTextStyles.mulishBlack14w400;
    if (textColor == null) textColor = AppColors.black;
    if (isCentered == null) isCentered = false;
    if (maxLine == null) maxLine = 1;
    if (islongTxt == null) islongTxt = false;
    return Text(
      text!,
      textAlign: isCentered! ? TextAlign.center : TextAlign.start,
      maxLines: islongTxt! ? null : maxLine,
      style: textStyle,
    );
  }
}
