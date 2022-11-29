part of 'get_user_cubit.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();
  @override
  List<Object> get props => [];
}

class GetUserInitial extends GetUserState {}

class GetUserSuccess extends GetUserState {
  final UserModel result;
  const GetUserSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class GetUserFailed extends GetUserState {
  final String message;
  const GetUserFailed(this.message);
  @override
  List<Object> get props => [message];
}

class GetUserLoading extends GetUserState {}
