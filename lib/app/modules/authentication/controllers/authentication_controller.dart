import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_project/app/data/models/user_model/user_model.dart';
import 'package:real_project/app/data/repos/user/user_repo.dart';
import 'package:real_project/app/data/services/firebase_auth/firebase_auth_service.dart';

import '../authentication.dart';

class AuthenticationController extends GetxController {
  static final AuthenticationController findAuthCont = Get.find();
  final AuthenticationService _authenticationService;
  final Rx<AuthenticationState> _authState = const AuthenticationState().obs;

  final Rx<UserModel> _userModel = const UserModel().obs;
  RxString verificationId = ''.obs;

  AuthenticationState get getState => _authState.value;

  UserModel get getCurrentUser => _userModel.value;

  AuthenticationController(this._authenticationService);

  // getAuthenticatedUser() => _getAuthenticatedUser();

  @override
  void onInit() {
    log('AuthenticationController is started working!');
    _getAuthenticatedUser();
    super.onInit();
  }

// void _setState(){}
  void _getAuthenticatedUser() async {
    _authState.value = AuthenticationLoadingState();
    log('_authState.value ====> ${_authState.value}');

    UserModel? user = await _authenticationService.getCurrentUser();
    user = null;

    if (user == null || user == const UserModel()) {
      _authState.value = UnAuthenticatedState();
      log('user jok _authState.value =======> ${_authState.value}');
    } else {
      // setAuthState(_user);
      _authState.value = AuthenticatedUserState(user);
      log(
        'user bar _authState.value =======> ${_authState.value}',
      );
    }
  }

  Future<void> verifyPhoneNumber({String? phoneNumber}) async {
    await firebaseAuthService.verifyPhoneNumber(
      phoneNumber: phoneNumber,
    );
    // verificationId.value == ''
    // verificationId.value != ''
    log('verificationId.value ==> ${verificationId.value}');
    if (verificationId.value.isNotEmpty) {
      _authState.value = OtpVerificationState(phoneNumber!);
    }
    // Get.to(() => PhoneOtp(code: phoneNumber!));
  }

  Future<void> sendSmsCode({String? smsCode}) async {
    _authState.value = AuthenticationLoadingState();
    final userModel = await userRepo.sendSmsCode(smsCode: smsCode);
    _authState.value = AuthenticatedUserState(userModel!);
  }
  // void _login() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '+44 7123 123 456',
  //     // verificationCompleted: (PhoneAuthCredential credential) {

  //     // },
  //     verificationFailed: (FirebaseAuthException e) {},
  //     codeSent: (String verificationId, int? resendToken) {},
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // _onVerificationCompleted(PhoneAuthCredential authCredential) async {
  //   print("verification completed ${authCredential.smsCode}");
  //   User? user = FirebaseAuth.instance.currentUser;
  //   setState(() {
  //     this.otpCode.text = authCredential.smsCode!;
  //   });
  //   if (authCredential.smsCode != null) {
  //     try {
  //       UserCredential credential =
  //           await user!.linkWithCredential(authCredential);
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'provider-already-linked') {
  //         await _auth.signInWithCredential(authCredential);
  //       }
  //     }
  //     setState(() {
  //       isLoading = false;
  //     });
  //     // Navigator.pushNamedAndRemoveUntil(
  //     //     context, Constants.homeNavigate, (route) => false);
  //   }
  // }

  // _onVerificationFailed(FirebaseAuthException exception) {
  //   if (exception.code == 'invalid-phone-number') {
  //     // showMessage("The phone number entered is invalid!");
  //   }
  // }

  // _onCodeSent(String verificationId, int? forceResendingToken) {
  //   this.verificationId = verificationId;
  //   print('forceResendingToken ===> $forceResendingToken');
  //   print("code sent");
  // }

  // _onCodeTimeout(String timeout) {
  //   return null;
  // }

  // void login({String? phoneNumber}) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     verificationCompleted: _onVerificationCompleted,
  //     verificationFailed: _onVerificationFailed,
  //     codeSent: _onCodeSent,
  //     codeAutoRetrievalTimeout: _onCodeTimeout,
  //   );
  // }
}

// class UnUsed{
// Future<String> signIn({
//     bool isGoogle = false,
//     bool isFacebook = false,
//     String email = '',
//     String password = '',
//     Callback? callback,
//   }) async {
//     var response;
//     if (email != '' && password != '') {
//       response = await _authenticationService.signInWithEmailAndPassword(
//           email, password);

//       if (response is String) {
//         log('_reponse:======= $response');
//         return response;
//       } else if (response is UserModel) {
//         _userModel.value = response;
//       }
//     }
//     if (isGoogle) {
//       response = await _authenticationService.signInWithGoogle();
//       if (response is String) {
//         log('_reponse:======= $response');
//         return response;
//       } else if (response is UserModel) {
//         _userModel.value = response;
//       }
//     }
//     if (isFacebook) {
//       response = await _authenticationService.signInWithFacebook();
//       if (response is String) {
//         log('_reponse:======= $response');
//         return response;
//       } else if (response is UserModel) {
//         _userModel.value = response;
//       }
//     }
//     if (_userModel.value == UserModel()) {
//       _authState.value = UnAuthenticated();
//     } else if (response is String) {
//       ///TODO:
//     } else {
//       final UserModel u = await userServices.getUser(_userModel.value.id);
//       _userModel.value = u;
//       setAuthState(u);
//       log('${_authState.value}');
//     }
//     callback();
//   }
//   Future<void> createWithEmailAndPassword(
//       {String email,
//       String password,
//       VoidCallback getBack,
//       VoidCallback callback}) async {
//     final user = await _authenticationService.createWithEmailAndPassword(
//         email, password);
//     if (user != null) {
//       getBack();
//       _authState.value = AuthenticatedUserState(user);
//     } else {
//       callback();
//     }
//   }
//   Future<void> createAccount({
//     UserModel user,
//     VoidCallback callback,
//   }) async {
//     final UserModel user = await userServices.createAccount(user);
//     setAuthState(user);
//     log('createAccount ====> ${_authState.value}');
//     callback();
//   }
//   // Future<void> createUser({
//   //   bool isGoogle = false,
//   //   bool isFacebook = false,
//   //   UserModel user,
//   // }) async {
//   //   UserModel _user = UserModel();
//   //   if (user != null) {
//   //     // _user = await _authenticationService.createWithEmailAndPassword(
//   //     //     email, password);
//   //   }
//   //   if (isGoogle) {
//   //     _user = await _authenticationService.signInWithGoogle();
//   //   }
//   //   if (isFacebook) {
//   //     _user = await _authenticationService.signInWithFacebook();
//   //   }
//   //   if (_user == UserModel() || _user == null) {
//   //     _authenticationStateStream.value = UnAuthenticated();
//   //   } else {
//   //     final _u = await userServices.getUser(_user.id);
//   //    setAuthState(_user); log('${_authenticationStateStream.value }');
//   //   }
//   // }
//   void signOut() async {
//     await _authenticationService.signOut();
//     _authState.value = UnAuthenticated();
//   }
//   void setAuthState(UserModel user) {
//     switch (user.role) {
//       case 'store':
//         _authState.value = AuthenticatedAsStore(user);
//         log('setAuthState.user ======> ${user.role} and state $state');
//         break;
//       case 'wholesale_buyer':
//         _authState.value = AuthenticatedAsWholesaleBuyer(user);
//         log('setAuthState.user ======> ${user.role} and state $state');
//         break;
//       case 'cargo':
//         _authState.value = AuthenticatedAsCargo(user);
//         log('setAuthState.user ======> ${user.role} and state $state');
//         break;
//       case 'factory':
//         _authState.value = AuthenticatedAsFactory(user);
//         log('setAuthState.user ======> ${user.role} and state $state');
//         break;
//       default:
//         _authState.value = UnAuthenticated();
//         log('setAuthState.user ======> ${user.role} and state $state');
//         break;
//     }
//   }
// }
