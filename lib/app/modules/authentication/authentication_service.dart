import '../../data/models/user_model/user_model.dart';

abstract class AuthenticationService {
  Future<UserModel> getCurrentUser();
  Future<UserModel> getCurrentCachedUser();
  Future<dynamic> signInWithPhone(String phoneNumber);
  // Future<UserModel> createWithEmailAndPassword(String email, String password);
  // Future<dynamic> signInWithGoogle();
  // Future<dynamic> signInWithFacebook();
  Future<bool> signOut();
}

class FirebaseAuthenticationService extends AuthenticationService {
  @override
  Future<UserModel> getCurrentCachedUser() {
    // TODO: implement getCurrentCachedUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUser() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return const UserModel(userID: '001', name: 'FireBase');
    });
  }

  @override
  Future signInWithPhone(String phoneNumber) {
    // TODO: implement signInWithPhone
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}

class AwsAuthenticationService extends AuthenticationService {
  @override
  Future<UserModel> getCurrentCachedUser() {
    // TODO: implement getCurrentCachedUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUser() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return const UserModel(userID: '002 ', name: 'AWS');
    });
  }

  @override
  Future signInWithPhone(String phoneNumber) {
    // TODO: implement signInWithPhone
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

class BashkaServis extends AuthenticationService {
  @override
  Future<UserModel> getCurrentCachedUser() {
    // TODO: implement getCurrentCachedUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future signInWithPhone(String phoneNumber) {
    // TODO: implement signInWithPhone
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}



















// abstract class KiruuServisi {
//   Future<UserModel> getCurrentUser();
//   Future<UserModel> signInWithPhone (String phoneNumber);

// }
// class FirebasedinKiruuServisi extends KiruuServisi{
//   @override
//   Future<UserModel> getCurrentUser() {
//     // TODO(Janibek): implement getCurrentUser - tashtap ketiptir nege 
//     // tashtady dep komandadan surasak bolot
//     throw UnimplementedError();
//   }

//   @override
//   Future<UserModel> signInWithPhone(String phoneNumber) {
//     // TODO: implement signInWithPhone
//     throw UnimplementedError();
//   }

// }

// abstract class AuthenticationService {
//   Future<UserModel> getCurrentUser();
//   Future<UserModel> getCurrentCachedUser();
//   Future<dynamic> signInWithEmailAndPassword(String email, String password);
//   Future<UserModel> createWithEmailAndPassword(String email, String password);
//   Future<dynamic> signInWithGoogle();
//   Future<dynamic> signInWithFacebook();
//   Future<bool> signOut();
// }

// class ServerAuthenticationService extends AuthenticationService {
//   @override
//   Future<UserModel> getCurrentUser() async {
//     UserModel user = await firestoreAuthServices.currentUser();
//     if (user != null) {
//       return await userServices.getUser(user.id);
//     } else {
//       return null;
//     }
//   }

//   @override
//   Future<bool> signOut() async {
//     try {
//       return await firestoreAuthServices.signOut();
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<UserModel> signInWithFacebook() async {
//     return await firestoreAuthServices.signInWithFacebook();
//   }

//   @override
//   Future<UserModel> signInWithGoogle() async {
//     return await firestoreAuthServices.signInWithGoogle();
//   }

//   @override
//   Future<UserModel> getCurrentCachedUser() {
//     // TODO: implement getCurrentCachedUser
//     throw UnimplementedError();
//   }

//   @override
//   Future<dynamic> signInWithEmailAndPassword(
//       String email, String password) async {
//     return await firestoreAuthServices.signInWithEmailandPassword(
//         email, password);
//   }

//   @override
//   Future<UserModel> createWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       return await firestoreAuthServices.createUserWithEmailandPassword(
//           email, password);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

// class AuthenticationException implements Exception {
//   final String message;

//   AuthenticationException({this.message = 'Unknown error occurred. '});
// }
