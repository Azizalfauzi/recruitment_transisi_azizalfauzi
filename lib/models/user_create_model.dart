part of 'models.dart';

class UserCreateModel {
  UserCreateModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory UserCreateModel.fromJson(Map<String, dynamic> json) =>
      UserCreateModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );
}
