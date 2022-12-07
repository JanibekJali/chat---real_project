import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_project/app/data/models/user_model/user_model.dart';

class FirestoreServices {
  final FirebaseFirestore _firestoreDB = FirebaseFirestore.instance;
  Future<bool?>? checkUserExists(String? userID) async {
    DocumentSnapshot? getUser = await _firestoreDB.doc("users/$userID").get();

    return getUser.exists;
  }

  Future<UserModel> getUser(String userID) async {
    DocumentSnapshot getUser = await _firestoreDB.doc("users/$userID").get();

    final getUserMap = getUser.data() as Map<String, dynamic>;

    UserModel getUserObject = UserModel.fromJson(getUserMap);

    return getUserObject;
  }

  Future<bool> saveUserToFirestore(UserModel user) async {
    return await _firestoreDB
        .collection("users")
        .doc(user.userID)
        .set(user.toJson(), SetOptions(merge: true))
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
}

final FirestoreServices firestoreServices = FirestoreServices();
