import 'package:real_project/app/data/models/user_model/user_model.dart';
import 'package:real_project/app/data/services/firebase_auth/firebase_auth_service.dart';
import 'package:real_project/app/data/services/user_services/user_services.dart';

class UserRepo {
  Future<UserModel?>? sendSmsCode({String? smsCode}) async {
    final userCred = await firebaseAuthService.validateOtp(smsCode!);
    final user = userCred.user;
    final isUserExist = await checkUserExist(user!.uid);
    if (isUserExist!) {
      return await userServices.getUser(user.uid);
    } else {
      final userModel = UserModel(
        name: user.displayName ?? 'N/A',
        userID: user.uid,
      );
      return await userServices.createAccount(userModel);
    }
  }

  Future<bool?>? checkUserExist(String? userID) async {
    return await userServices.checkUserExist(userID);
  }
}

final UserRepo userRepo = UserRepo();
