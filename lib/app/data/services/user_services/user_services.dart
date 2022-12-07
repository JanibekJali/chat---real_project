import 'package:real_project/app/data/models/user_model/user_model.dart';
import 'package:real_project/app/data/services/firestore/firestore_services.dart';

class UserServices {
  Future<bool?>? checkUserExist(String? userID) async {
    return await firestoreServices.checkUserExists(userID);
  }

  Future<UserModel>? getUser(String userID) async {
    try {
      return await firestoreServices.getUser(userID);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel> createAccount(UserModel user) async {
    try {
      await firestoreServices.saveUserToFirestore(user);

      print('UserServices.createAccount user.id: ${user.userID}');
      return await getUser(user.userID!)!;
    } catch (e) {
      throw Exception(e);
    }
  }
}

final UserServices userServices = UserServices();
