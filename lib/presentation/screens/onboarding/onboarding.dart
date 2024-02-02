import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:ticead/presentation/landing_screen.dart';
import '../../widgets/onboarding/mainPage_widget.dart';
import '../../widgets/onboarding/onboarding_contents.dart';
class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        
        itemBuilder: (index) {
         var page = contents[index];
          // final page = contents[index % contents.length];
          if(index==contents.length){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> LandingScreen(email: "sdfdsgf")));
          }
          
          return SafeArea(child: MainPageWidget(page: page));
        },
        nextButtonBuilder: (context) => const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        colors: const [
          Color.fromARGB(255, 200, 200, 200),
          Colors.amber,
          Colors.teal
        ],

        
      ),
    );
  }
}
