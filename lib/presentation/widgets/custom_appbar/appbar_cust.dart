import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
    final text;
    final icon;
   @override
     final Size preferredSize;

  const CustomAppbar({super.key,required this.text, this.icon}): preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AppBar(
        
         leading: icon,
         actions: [Padding(
           padding: const EdgeInsets.all(8.0),
           child: Image.asset('asset/image/logotiecad.png',height: 30,),
         )],
        backgroundColor: Colors.black,title: Text(text, style:TextStyle(color: Colors.white),)),
    );

    
  }
  
}