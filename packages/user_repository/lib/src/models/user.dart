import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  User(this.token, this.userId, this.userInfo);

  String? token;
  int? userId;
  UserInfo? userInfo;

 static User userFromJson(String str) => User.fromJson(json.decode(str));


  factory User.fromJson(Map<String, dynamic> json) => User(
    json["token"],
    json["user_id"],
    UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user_id": userId,
    "user_info": userInfo?.toJson(),
  };

  @override
  List get props => [token, userId, userInfo];

  static final empty = User('', 0, UserInfo());
}

class UserInfo {
  UserInfo({
    this.firstName,
    this.lastName,
    this.email,
    this.userConsent,
    this.isActiveListening,
    this.newborn,
  });

  String? firstName;
  dynamic lastName;
  String? email;
  bool? userConsent;
  bool? isActiveListening;
  dynamic newborn;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    userConsent: json["user_consent"],
    isActiveListening: json["is_active_listening"],
    newborn: json["newborn"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "user_consent": userConsent,
    "is_active_listening": isActiveListening,
    "newborn": newborn,
  };
}
