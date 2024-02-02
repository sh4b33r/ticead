import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:ticead/application/login_bloc/login_bloc.dart';
import 'package:ticead/application/login_bloc/login_event.dart';
import 'package:ticead/application/login_bloc/login_state.dart';

import 'package:ticead/presentation/screens/home_screen/homescreen.dart';
import 'package:ticead/presentation/screens/main_screen/main_screen.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBLoc, LoginState>(
        listener: (context, state) {
          // =======================
          if (state is LoginSuccessState) {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (ctx) => LandingScreen(email: state.email)));
         Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => MainScreen()));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Successfully by ${state.email}"),
                duration: const Duration(seconds: 2),
              ),
            );
          } else if (state is LoginFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
          }

          // =======================
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                child: Image.asset(
                  "asset/image/logotiecad.png",
                  height: 190,
                  width: 140,
                ),
              ),
              const Text('SignIn With'),
              Center(

                  child: state is LoginLoadingState
                      ? CircularProgressIndicator()
                      : SignInButton(
                          buttonType: ButtonType.google,
                          onPressed: () async {
                            //  final returning=await signInwithgoogle();

                            //              if(returning!=null){ Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> LandingScreen() ));             }

                            // context.read<LoginBLoc>().add(LoginButtonCLicked());
                            BlocProvider.of<LoginBLoc>(context)
                                .add(LoginButtonCLicked());
                          })),

              // Center(
              //     child: SignInButton(
              //         buttonType: ButtonType.github, onPressed: () {})),
              // Center(
              //     child: SignInButton(
              //         buttonType: ButtonType.twitterX, onPressed: () {})),
              // Center(
              //     child: SignInButton(
              //         buttonType: ButtonType.apple, onPressed: () {})),
              // const SizedBox(
              //   height: 150,
              // )

              
            ],
          );
        },
      ),
    );
  }
}
