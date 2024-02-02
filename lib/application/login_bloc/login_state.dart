abstract class LoginState{}
class LogininitialState extends LoginState{}
class LoginLoadingState extends LoginState{}

// class LoginSuccesstate extends LoginState{}
class LoginSuccessState extends LoginState {
  final String email;

  LoginSuccessState(this.email);
}

class  LoginFailureState extends LoginState{
    final String error;

  LoginFailureState(this.error);
}