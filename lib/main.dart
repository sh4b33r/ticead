import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticead/application/login_bloc/login_bloc.dart';
import 'package:ticead/application/nav_bloc/nav_bloc.dart';
import 'package:ticead/application/splash_screen/splash_bloc.dart';
import 'package:ticead/firebase_options.dart';
import 'package:ticead/presentation/screens/main_screen/main_screen.dart';
import 'package:ticead/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
          BlocProvider(
          create: (context) => LoginBLoc(),
          
        ),
          BlocProvider(
          create: (context) => SplashBloc(),
          
        ),
          BlocProvider(
          create: (context) => NavPageBloc(),
          
        ),
       
       ],
      child:  const SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme:t
          // ,
          
          // home: Loginscreen(),
          // home: SplashScreen(),
          home:MainScreen()
        ),
      ),
    );
  }
}
