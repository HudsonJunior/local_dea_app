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
      'placa': user,
      'senha': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      user: map['placa'] ?? '',
      password: map['senha'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.withHash(LoginModel model, String hash) =>
      LoginModel(user: model.user, password: hash);

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
