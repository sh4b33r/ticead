
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared_preference/shared_class.dart';

class FirebaseService {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 static var u;
 static Future<void> addUser(String email,String name) async {
    try {
 final data =await FirebaseFirestore.instance.collection('user').where('email', isEqualTo: email).get();
 print(" .................................${data.docs.isEmpty}.......................................");

  
      //  if(data!=null){
 
  final id=await FirebaseFirestore.instance.collection('user').add({
        'email': email,
        'name':name,
        'timestamp': FieldValue.serverTimestamp(),
      });
   
      //  SharedPref.sharedpreid(true,
      //  id: id.id
      //  );
      //  }
    
// if (FirebaseService.u != null && FirebaseService.u['email'] != null) {

u =await SharedPref.shrprefsetid(id.id);
  print('......                .>>>>>>>>>>FirebaseService.u: ${FirebaseService.u}..............................');
// }else{

// }
     
      // SharedPref.shrprefsetid(id.id);
    
    } catch (e) {
      log('Error adding user to Firestore: $e');
    }
  }
}



firestoreget(String id)async{
  final userSnapshot=await FirebaseFirestore.instance.collection('user').doc(id).get();
  // userSnapshot.exists
Map<String, dynamic> userDetails=userSnapshot.data() as Map<String, dynamic>;
    print('User Details: $userDetails............................printed last....................................');
    return userDetails;
//   (id)
// .get().then((DocumentSnapshot) =>
//       print(DocumentSnapshot.data['key'].toString());
// );
}






















































































































































































