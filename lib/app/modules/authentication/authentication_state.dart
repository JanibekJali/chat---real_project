import 'package:equatable/equatable.dart';

import '../../data/models/user_model/user_model.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

// AuthenticationLoadingState - is entering or a data is loading state
class AuthenticationLoadingState extends AuthenticationState {}

// UnAuthenticatedState - No Authentication
class UnAuthenticatedState extends AuthenticationState {}

// Locasiyaga uruksat berilgen jok
class NoLocationPermissionState extends AuthenticationState {}

class AuthenticatedUserState extends AuthenticationState {
  final UserModel user;

  const AuthenticatedUserState(this.user);

  @override
  List<Object> get props => [user];
}

class OtpVerificationState extends AuthenticationState {
  final String phoneNumber;

  const OtpVerificationState(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class AuthenticationFailureState extends AuthenticationState {
  final String message;

  const AuthenticationFailureState(this.message);

  @override
  List<Object> get props => [message];
}

class UnUsedButUsefull {
  // class AuthenticatedAsAdmin extends AuthenticationState {
//   final UserModel user;

//   const AuthenticatedAsAdmin(this.user);

//   @override
//   List<Object> get props => [user];
// }
// class AuthenticatedAsAgent extends AuthenticationState {
//   final UserModel user;

//   AuthenticatedAsAgent(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class AuthenticatedAsWholesaleBuyer extends AuthenticationState {
//   final UserModel user;

//   AuthenticatedAsWholesaleBuyer(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class AuthenticatedAsStore extends AuthenticationState {
//   final UserModel user;

//   AuthenticatedAsStore(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class AuthenticatedAsFactory extends AuthenticationState {
//   final UserModel user;

//   AuthenticatedAsFactory(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class AuthenticatedAsCargo extends AuthenticationState {
//   final UserModel user;

//   AuthenticatedAsCargo(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class AuthenticatedAsBuyer extends AuthenticationState {
//   final UserModel user;

//   AuthenticatedAsBuyer(this.user);

//   @override
//   List<Object> get props => [user];
// }
}
