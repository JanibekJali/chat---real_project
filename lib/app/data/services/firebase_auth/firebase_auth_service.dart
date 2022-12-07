import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:real_project/app/app_widgets/diologs/custom_dialog.dart';
import 'package:real_project/app/modules/authentication/authentication.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;
  bool success = false;
  final AuthenticationController _authenticationController =
      AuthenticationController.findAuthCont;

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    try {
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> verifyPhoneNumber({String? phoneNumber}) async {
    // await _auth.setLanguageCode('ru');

    print('verifyPhoneNumber phoneNumber: $phoneNumber');

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credentail
        // await signInWithCredential(credetial);
      },
      codeSent: (String? verificationId, int? resendToken) async {
        _authenticationController.verificationId.value = verificationId!;
        // if (isSignin) {
        //   // Get.toNamed(Routes.OTP_SIGNIN);
        // } else {
        //   // Get.toNamed(Routes.OPT);
        // }
        Get.snackbar(
          'Код отпрвлен',
          'Пожалуйста, проверьте свои сообщения, чтобы получить код',
          duration: const Duration(seconds: 3),
        );
      },
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out ...
      },
      verificationFailed: (FirebaseAuthException e) async {
        if (e.code == 'invalid-phone-number') {
          await CustomDialog().getDialog(
            title: 'Ошибка',
            content: 'Предоставленный номер телефона недействителен.',
            isError: true,
          );
        } else if (e.code == 'too-many-requests') {
          await CustomDialog().getDialog(
            title: 'Ошибка',
            content:
                'Мы заблокировали из-за необычной активности. Попробуйте позже. ',
            isError: true,
          );
        } else {
          await CustomDialog().getDialog(
            title: 'Ошибка',
            content: 'Что-то пошло не так. Пожалуйста, попытайтесь еще раз ',
            isError: true,
          );
        }
        print('FirebaseAuthException at verifyPhone: ${e.code}');

        // Handle other errors
      },
    );
  }

  Future<UserCredential> validateOtp(String smsCode) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: _authenticationController.verificationId.value,
        smsCode: smsCode);
    return await signInWithCredential(authCredential);
  }
  // Future<UserCredential> validateOtpAndRegister(String smsCode) async {
  //   final AuthCredential _authCredential = PhoneAuthProvider.credential(
  //       verificationId: _verificationId!, smsCode: smsCode);
  //   final userCred = await signInWithCredential(_authCredential);
  //   if (userCred != null) {
  //     return userCred;
  //   } else {
  //     await CustomDialog().getDialog(
  //       title: 'Ошибка!',
  //       content: 'Произошло ошибка при регистрации, попробуйте еще раз',
  //       isError: true,
  //     );
  //     return userCred;
  //   }
  // }

}

final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
