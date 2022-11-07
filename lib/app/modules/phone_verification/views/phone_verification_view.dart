import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_project/app/app_constants/text_styles/app_text_styles.dart';
import 'package:real_project/app/app_widgets/buttons/custom_button_widget.dart';
import 'package:real_project/app/app_widgets/keyboard/key_board.dart';

import '../controllers/phone_verification_controller.dart';

class PhoneVerificationView extends GetView<PhoneVerificationController> {
  const PhoneVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoneVerificationView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Enter Your Phone Number',
                    style: AppTextStyles.mulishBlack24w700,
                  ),
                ),
                Text(
                  'Enter Your Phone Number',
                  style: AppTextStyles.mulishBlack14w400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: CustomButtonWidget(
                    buttonText: 'Continue',
                    buttonTextStyle: AppTextStyles.mulishWhite16w600,
                    onTap: () {},
                    buttonVer: Get.size.height * 0.020,
                    buttonHor: Get.size.width * 0.35,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: KeyPad())
        ],
      ),
    );
  }
}

// Flutter textField hide keyboard 
// read only
