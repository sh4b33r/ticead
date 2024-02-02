import 'package:flutter/material.dart';
import 'package:ticead/presentation/widgets/custom_appbar/appbar_cust.dart';
import 'package:ticead/presentation/widgets/c_drawer/drawer.dart';
import 'package:ticead/presentation/widgets/gridview_movies.dart';

class HOmeScreen extends StatelessWidget {
  final email;
  HOmeScreen({super.key, this.email = ''});
  // final keyhome = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: keyhome,
      drawer: DrawerCustom(
        email: email,
      ),
      appBar: CustomAppbar(
          text: 'Home',
          icon: IconButton(
              onPressed: () {
                // keyhome.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ))),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                color: Colors.black,
              ),
            ),
            const GridsMovie(text: 'Recent Movies',),
            const GridsMovie(text: 'Super Hits',),
          ],
        ),
      ),
    );
  }
}






// ElevatedButton(
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                 await GoogleSignIn().signOut();
//                     SharedPref.sharedprefset(false);
//                 Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (ctx) => const Loginscreen()),
//                     (route) => true);
//               },
//               child: const Text('logOut')),