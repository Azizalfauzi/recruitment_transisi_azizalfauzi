import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_user_state.dart';

class ListUserCubit extends Cubit<ListUserState> {
  ListUserCubit() : super(ListUserInitial());
}
