import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recruitment_transisi_azizalfauzi/models/models.dart';
import 'package:recruitment_transisi_azizalfauzi/services/services.dart';

part 'list_user_state.dart';

class ListUserCubit extends Cubit<ListUserState> {
  ListUserCubit() : super(ListUserInitial());
  void getUserList() async {
    try {
      emit(ListUserLoading());
      List<UserListModel> result = await UserServices.getUserList();
      emit(ListUserGetSuccess(result));
    } catch (e) {
      emit(ListUserGetFailed(e.toString()));
    }
  }
}
