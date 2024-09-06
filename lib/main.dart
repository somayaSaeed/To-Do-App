import 'package:flutter/material.dart';

import 'UI/Home/home_Screen.dart';

void main(){
  runApp(ToDoApp());
}
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName ,
      routes: {
        HomeScreen.routName : (context) => HomeScreen(),

      },
    );
  }
}
