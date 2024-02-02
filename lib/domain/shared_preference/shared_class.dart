import 'dart:async';
import 'dart:core';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import '../firbase_firestore/firbase_user.dart';

class SharedPref {
  static Future<void> sharedprefset(bool val) async {
    final shared = await SharedPreferences.getInstance();
    shared.setBool('LoginState', val);
    // var idreturn=await getid();
    //  print(idreturn.toString());
  }

  static Future<bool?> sharedprefget() async {
    final shared = await SharedPreferences.getInstance();
    return shared.getBool('LoginState');
  }



  static Future<dynamic> shrprefsetid(id) async {
    print('''keeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrriiiiiiiiiiiiiiii''');
    final shared = await SharedPreferences.getInstance();
    shared.setString('id', id);
    var a = shared.getString('id');
    print(
        ' .........>>>>>>>>>>>>>>>>>>>> $a     <<<<>>>>>>>>>>>>>><<<<<<<<<<<<');
    Map<String, dynamic> tosend = await firestoreget(id);
    log(tosend.toString());
    return tosend;
  }




  static Future<String?> getid() async {
    final shared = await SharedPreferences.getInstance();
    return shared.getString('id');
  }
 
 

  // static Future<String?> getemailforid() async {
  //   final shared = await SharedPreferences.getInstance();
  //   return shared.getString('id');
  // }
 
}
