import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_project/app/modules/authentication/authentication_service.dart';
import 'package:real_project/app/modules/authentication/controllers/authentication_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    log('AuthenticationBinding is started working');
    Get.put<AuthenticationController>(
      AuthenticationController(
        Get.put<FirebaseAuthenticationService>(
          FirebaseAuthenticationService(),
        ),
        // Get.put<AwsAuthenticationService>(
        //   AwsAuthenticationService(),
        // ),
        // Get.put<BashkaServis>( ичинде калган бүт функциялар өзгөрбөйт
        //   BashkaServis(), эң оңой жолдо башка сервиске өтүп кетесиң
        // ),
      ),
      permanent: true,
    );
    //   Get.put<AuthenticationController>(
    //       AuthenticationController(Get.put(ServerAuthenticationService())),
    //       permanent: true);
    // }
  }
}
