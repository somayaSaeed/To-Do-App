import 'package:flutter/material.dart';

import 'UI/Home/home_Screen.dart';
import 'Utils/Theme/Theme.dart';

void main(){
  runApp(const ToDoApp());
}
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName ,
      theme: MyThemeData.lightMode,

      routes: {
        HomeScreen.routName : (context) => const HomeScreen(),


      },
    );
  }
}
