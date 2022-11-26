import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_project/app/data/models/user_model/user_model.dart';

import '../authentication.dart';

class AuthenticationController extends GetxController {
  static final AuthenticationController findAuthCont = Get.find();
  final AuthenticationService _authenticationService;
  final Rx<AuthenticationState> _authState = const AuthenticationState().obs;

  final Rx<UserModel> _userModel = const UserModel().obs;

  AuthenticationState get state => _authState.value;

  UserModel get getCurrentUser => _userModel.value;

  AuthenticationController(this._authenticationService);

  // getAuthenticatedUser() => _getAuthenticatedUser();

  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  void _getAuthenticatedUser() async {
    _authState.value = AuthenticationLoadingState();

    final user = await _authenticationService.getCurrentUser();
    // const user = null;

    if (user == null || user == const UserModel()) {
      _authState.value = UnAuthenticatedState();
      log('_getAuthenticatedUser =======> ${_authState.value}');
    } else {
      // setAuthState(_user);
      _authState.value = AuthenticatedUserState(user);
      log('_getAuthenticatedUser.setAuthState =======> ${_authState.value}');
    }
  }
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
