import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment_transisi_azizalfauzi/models/models.dart';

import '../../../services/services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  void loginApp(String email, String password) async {
    try {
      emit(LoginLoading());
      LoginModel result = await AuthServices.loginApp(email, password);
      emit(LoginSuccess(result));
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }

  void logout() {
    AuthServices.signOut();
  }
}
