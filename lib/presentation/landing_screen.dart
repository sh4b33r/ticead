// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ticead/domain/firbase_firestore/firbase_user.dart';
import 'package:ticead/domain/shared_preference/shared_class.dart';
import 'package:ticead/presentation/screens/loginscreen/login_screen.dart';
import 'package:ticead/presentation/screens/onboarding/onboarding.dart';

class LandingScreen extends StatelessWidget {
  final String email;
  // static const routeName = '/extractArguments';

  const LandingScreen({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(email),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                    SharedPref.sharedprefset(false);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx) => const Loginscreen()),
                    (route) => true);
              },
              child: const Text('logOut')),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const OnBoarding()));
              }, child:const Text('next')),

              ElevatedButton(onPressed: ()async{
             var u=await  FirebaseService.u['email'];
             log(u);
              }, child:const Text('Demo'))
        ],
      ),
    );
  }
}
