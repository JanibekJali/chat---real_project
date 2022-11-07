import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_project/app/app_constants/assets/app_assets.dart';
import 'package:real_project/app/app_constants/text_styles/app_text_styles.dart';
import 'package:real_project/app/app_widgets/buttons/custom_button_widget.dart';
import 'package:real_project/app/routes/app_pages.dart';

import '../controllers/walkthrough_controller.dart';

class WalkthroughView extends GetView<WalkthroughController> {
  const WalkthroughView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WalkthroughView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SvgPicture.asset('assets/vectors/illustrations/walkthrough.svg'),
            AppAssets.walkthrough(height: 230),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                'Connect easily with your family and friends over countries',
                style: AppTextStyles.mulishBlack24w900,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                Text('Terms & Privacy Policy',
                    style: AppTextStyles.mulishBlack14w600),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonWidget(
                  buttonText: 'Start Messaging',
                  buttonTextStyle: AppTextStyles.mulishWhite16w600,
                  buttonVer: Get.size.height * 0.020,
                  buttonHor: Get.size.width * 0.35,
                  onTap: () => Get.toNamed(Routes.PHONE_VERIFICATION),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
