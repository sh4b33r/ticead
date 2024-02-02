import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:ticead/application/login_bloc/login_event.dart';
import 'package:ticead/application/login_bloc/login_state.dart';
import 'package:ticead/domain/firbase_firestore/firbase_user.dart';
import 'package:ticead/domain/shared_preference/shared_class.dart';
import 'package:ticead/domain/sigin.dart';

class LoginBLoc extends Bloc<LoginEvent, LoginState> {
  LoginBLoc() : super(LogininitialState()) {
    on<LoginButtonCLicked>((event, emit) async {
      
      emit(LoginLoadingState());

      bool result = await InternetConnection().hasInternetAccess;

      if (result) {
        final email = await signInwithgoogle();

        await FirebaseService.addUser(email['email'], email['name']);

        if (email['email'] != null) {
          SharedPref.sharedprefset(true);
          emit(LoginSuccessState(email['email']));
        } else {
          emit(LoginFailureState('errorrrr'));
        }
      } else {
        emit(LoginFailureState('Check your Internet Connection'));
      }
    });
  }
}
