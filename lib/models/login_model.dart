import 'dart:convert';

class LoginModel {
  final String user;
  final String password;

  LoginModel({
    required this.user,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      user: map['user'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
