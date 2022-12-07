import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_project/app/app_widgets/progress/progress.dart';
import 'package:real_project/app/modules/authentication/authentication.dart';
import 'package:real_project/app/modules/home/views/home_view.dart';
import 'package:real_project/app/modules/phone_verification/views/phone_otp.dart';
import 'package:real_project/app/modules/phone_verification/views/phone_verification_view.dart';

class RedirectView extends StatelessWidget {
  final AuthenticationController _authenticationController =
      AuthenticationController.findAuthCont;
  RedirectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_authenticationController.getState is AuthenticationLoadingState) {
        return Scaffold(
          body: Center(child: circularProgress()),
        );
      } else if (_authenticationController.getState is OtpVerificationState) {
        return PhoneOtp(
            code: (_authenticationController.getState as OtpVerificationState)
                .phoneNumber);
      } else if (_authenticationController.getState is UnAuthenticatedState) {
        return const PhoneVerificationView();
      } else if (_authenticationController.getState is AuthenticatedUserState) {
        return const HomeView();
      }
      return const Scaffold(
        body: Center(child: Text('Something went wrong!Please try again')),
      );
    });
  }
}
