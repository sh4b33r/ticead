import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:ticead/application/nav_bloc/nav_bloc.dart';
import 'package:ticead/application/nav_bloc/nav_event.dart';
import 'package:ticead/application/nav_bloc/nav_state.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return
     
    
       SalomonBottomBar(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
  
          currentIndex: context.watch<NavPageBloc>().index,
          onTap: (i){
             context.read<NavPageBloc>().add(NavTabChangeCLicked(index: i));
    
          },
          items: [
    
    
           
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Color.fromARGB(134, 39, 176, 126),
            ),
    
            /// Likes
            SalomonBottomBarItem(
              icon:FaIcon(FontAwesomeIcons.ticket),
              title: const Text("Tickets"),
              selectedColor: Colors.pink,
            ),
    
            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("All Movies"),
              selectedColor: const Color.fromARGB(149, 0, 0, 0),
            ),
    
            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
    
        );
      }
 
  }

