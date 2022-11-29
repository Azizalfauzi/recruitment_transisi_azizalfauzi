part of 'routes_cubit.dart';

abstract class RoutesState extends Equatable {
  const RoutesState();
  @override
  List<Object> get props => [];
}

class RoutesInitial extends RoutesState {
  @override
  List<Object> get props => [];
}

class RoutesHome extends RoutesState {
  @override
  List<Object> get props => [];
}

class RoutesDetail extends RoutesState {
  final int id;
  const RoutesDetail(this.id);
  @override
  List<Object> get props => [id];
}

class RoutesCreate extends RoutesState {
  @override
  List<Object> get props => [];
}
class RoutesLogin extends RoutesState {
  @override
  List<Object> get props => [];
}
