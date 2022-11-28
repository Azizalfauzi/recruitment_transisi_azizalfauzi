// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
part 'routes_state.dart';

class RoutesCubit extends Cubit<RoutesState> {
  RoutesCubit() : super(RoutesLogin());
  Stream<RoutesState> mapEventToState(RoutesState state) async* {
    if (state is RoutesLogin) {
      emit(RoutesLogin());
    }else if(state is RoutesHome){
      emit(RoutesHome());
    } else if (state is RoutesDetail) {
      String id = '';
      emit(RoutesDetail(id));
    } else if (state is RoutesCreate) {
      emit(RoutesCreate());
    } else {
      emit(RoutesLogin());
    }
  }
}
