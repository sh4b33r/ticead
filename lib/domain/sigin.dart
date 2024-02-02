import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ticead/domain/shared_preference/shared_class.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

signInwithgoogle() async {
  final googlesignIn = GoogleSignIn();
  try {

    final GoogleSignInAccount? googleSignInAccount = await googlesignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
         final val= await FirebaseAuth.instance.signInWithCredential(credential);
         final email=val.user!.email;
         final name=val.user!.displayName;
         
            // print('............>>>>>>>>>>>>>>>>>>>${val.credential!.accessToken}');
        return {'email': email, 'name': name};
        
    }
  } catch (e) {
   throw(e.toString());
  }
}




