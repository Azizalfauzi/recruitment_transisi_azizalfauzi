import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment_transisi_azizalfauzi/models/models.dart';
import 'package:recruitment_transisi_azizalfauzi/services/services.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(CreateUserInitial());
  void createUser(String name, String job) async {
    try {
      emit(CreateUserLoading());
      UserCreateModel result = await UserServices.createUser(name, job);
      emit(CreateUserSuccess(result));
    } catch (e) {
      emit(CreateUserFailed(e.toString()));
    }
  }
}
