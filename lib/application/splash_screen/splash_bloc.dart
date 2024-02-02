import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticead/application/splash_screen/splash_state.dart';
import 'package:ticead/domain/shared_preference/shared_class.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    emit(SpalOnLoadingstate());
    
    Timer(const Duration(seconds: 4), () async {
      final shared = await SharedPref.sharedprefget();

      if (shared == true) {
             log('Error adding user to true');
          // Future.delayed(Duration(seconds: 2)).whenComplete(() =>  FirebaseService.u['email'] );  
        emit(Splassharedtrue());
        
      }else{
         log('Error adding user to else');
 emit(Splassharedfalse());
      }
      
    });
  }
}

