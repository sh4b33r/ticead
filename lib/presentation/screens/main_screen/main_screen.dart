import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticead/application/nav_bloc/nav_bloc.dart';
import 'package:ticead/presentation/landing_screen.dart';
import 'package:ticead/presentation/screens/home_screen/homescreen.dart';
import 'package:ticead/presentation/widgets/bottom_navbar.dart';

class MainScreen extends StatelessWidget {
  
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> pages=[HOmeScreen(),
    
     LandingScreen(email: 'like'),
     HOmeScreen(),
     LandingScreen(email: 'profile')
    ];
    return Scaffold(

 body:pages[context.watch<NavPageBloc>().index],

 bottomNavigationBar: CustomNavbar()
    );

  }
}