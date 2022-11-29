part of 'list_user_cubit.dart';

abstract class ListUserState extends Equatable {
  const ListUserState();
  @override
  List<Object> get props => [];
}

class ListUserInitial extends ListUserState {}

class ListUserLoading extends ListUserState {}

class ListUserGetSuccess extends ListUserState {
  final List<UserListModel> result;
  const ListUserGetSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class ListUserGetFailed extends ListUserState {
  final String message;
  const ListUserGetFailed(this.message);
  @override
  List<Object> get props => [message];
}
