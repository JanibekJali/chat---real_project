import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userID;
  final String? name;

  const UserModel({this.userID, this.name});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        userID: json['userID'],
      );
  Map<String, dynamic> toJson() => {
        'name': name ?? '',
        'userID': userID ?? '',
      };
  @override
  // TODO: implement props
  List<Object?> get props => [
        userID,
        name,
      ];
}
