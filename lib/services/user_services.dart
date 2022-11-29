part of 'services.dart';

class UserServices {
  static Future<List<UserListModel>> getUserList() async {
    final reponse = await Dio().get('${urlTransisi}api/users');
    final json = reponse.data;

    if (reponse.statusCode == 200) {
      List<UserListModel> result = (json['data'] as Iterable)
          .map((e) => UserListModel.fromJson(e))
          .toList();

      return result;
    } else if (reponse.statusCode == 404) {
      return throw Exception('Data User Tidak Ditemukan!');
    } else {
      return throw Exception("Ada kesalahan pada server!");
    }
  }

  static Future<UserModel> getDataUser(int id) async {
    try {
      final reponse = await Dio().get('${urlTransisi}api/users/$id');
      final json = reponse.data;

      if (reponse.statusCode == 200) {
        UserModel result = UserModel.fromJson(json['data']);
        return result;
      } else if (reponse.statusCode == 404) {
        return throw Exception(json['message']);
      } else {
        return throw Exception(json['msg']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
