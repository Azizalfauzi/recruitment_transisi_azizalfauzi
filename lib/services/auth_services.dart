part of 'services.dart';

class AuthServices {
  static Future<LoginModel> authLogin(String email, String password) async {
    Map<String, dynamic> loginData = {
      'codeEvent': email,
      'password': password,
    };
    final reponse = await Dio().post('$urlTransisi/api/login',
        data: loginData,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));

    final json = reponse.data;
    if (reponse.statusCode == 200) {
      LoginModel loginResult = LoginModel.fromJson(json);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', loginResult.token);
      return loginResult;
    } else if (reponse.statusCode == 401) {
      return throw Exception("Password salah!");
    } else if (reponse.statusCode == 404) {
      return throw Exception("Kode tidak valid!");
    } else {
      return throw Exception("Ada kesalahan pada server");
    }
  }

  /// Logout Method
  static Future<void> signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    preferences.remove('id');
    preferences.remove('kode_event');
    preferences.remove('name_event');
  }
}
