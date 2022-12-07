import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_project/app/app_constants/colors/app_colors.dart';
import 'package:real_project/app/app_constants/text_styles/app_text_styles.dart';

class CustomDialog {
  getDialog({String? title, String? content, bool isError = false}) {
    Get.defaultDialog(
      title: title!,
      titleStyle: isError
          ? AppTextStyles.mulishMainColor16w600
          : AppTextStyles.mulishBlack14w600,
      content: SizedBox(
        width: Get.size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: [
            Image.asset(
              'assets/images/logo-red.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(content!,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.mulishBlack16w600),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Text(
                  'OK',
                  style: AppTextStyles.mulishBlack14w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
