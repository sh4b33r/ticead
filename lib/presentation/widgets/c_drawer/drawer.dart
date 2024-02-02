import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ticead/presentation/screens/loginscreen/login_screen.dart';
import '../../../domain/shared_preference/shared_class.dart';

class DrawerCustom extends StatelessWidget {
  final String email;
  const DrawerCustom({super.key,this.email=''});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(151, 0, 0, 0),
      width: MediaQuery.of(context).size.width / 1.48,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 40,
              ),
              const SizedBox(
                height: 6,
              ),
              Text( email.isEmpty?'test123@gmail.com':email,
                
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) => const AboutScreen()));
                  },
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18),
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) => const TermsAndConditions()));
                  },
                  child: const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18),
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) => const PrivacyPolicy()));
                  },
                  child: const Text(
                    "About Us",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Report An Issue",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    await GoogleSignIn().signOut();
                    SharedPref.sharedprefset(false);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (ctx) => const Loginscreen()),
                        (route) => true);
                  },
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
