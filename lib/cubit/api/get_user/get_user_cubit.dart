import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment_transisi_azizalfauzi/models/models.dart';
import 'package:recruitment_transisi_azizalfauzi/services/services.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserInitial());
  void getUser(int id) async {
    try {
      emit(GetUserLoading());
      UserModel result = await UserServices.getDataUser(id);
      emit(GetUserSuccess(result));
    } catch (e) {
      emit(GetUserFailed(e.toString()));
    }
  }
}
