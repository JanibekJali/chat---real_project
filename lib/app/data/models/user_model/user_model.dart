import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userId;
  final String? name;

  const UserModel({this.userId, this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        name,
      ];
}
