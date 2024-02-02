import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticead/application/nav_bloc/nav_event.dart';
import 'package:ticead/application/nav_bloc/nav_state.dart';

class NavPageBloc extends Bloc<NavpageEvent, NavpageState> {
  int index=0;
  NavPageBloc() : super(NavpageInitial()) {
      on<NavTabChangeCLicked>((event, emit){
      index=event.index;
    emit(NavpageTabChange());
      });
  }
}