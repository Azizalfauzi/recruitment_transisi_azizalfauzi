part of 'models.dart';

class LoginModel {
  LoginModel({
    required this.token,
  });

  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
      );
}
