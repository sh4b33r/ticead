import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticead/application/splash_screen/splash_bloc.dart';
import 'package:ticead/presentation/screens/home_screen/homescreen.dart';
import 'package:ticead/presentation/screens/loginscreen/login_screen.dart';
import '../../application/splash_screen/splash_state.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        //  final loginState=SharedPref.sharedprefget();
        if (state is Splassharedtrue) {
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>  LandingScreen(email: FirebaseService.u['email'],)));
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => HOmeScreen(),
          ));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const Loginscreen()));
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:
                  Container(child: Image.asset('asset/image/cubeloading.gif')),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Loading ....',
                  textStyle: GoogleFonts.montserrat(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.width * .042,
                  ),
                  // textStyle: const TextStyle(
                  //   fontSize: 32.0,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  speed: const Duration(milliseconds: 300),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 800),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            )
          ],
        ),
      ),
    );
  }
}
