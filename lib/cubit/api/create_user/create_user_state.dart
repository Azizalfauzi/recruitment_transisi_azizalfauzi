part of 'create_user_cubit.dart';

abstract class CreateUserState extends Equatable {
  const CreateUserState();
  @override
  List<Object> get props => [];
}

class CreateUserInitial extends CreateUserState {}

class CreateUserSuccess extends CreateUserState {
  final UserCreateModel result;
  const CreateUserSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class CreateUserFailed extends CreateUserState {
  final String message;
  const CreateUserFailed(this.message);
  @override
  List<Object> get props => [message];
}

class CreateUserLoading extends CreateUserState {}
