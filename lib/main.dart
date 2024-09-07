import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'UI/home_Screen.dart';
import 'Utils/Theme/Theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyA1IXO_sjLH_Gy5BH0VI8TEspLA0x-1S8o',
        appId: 'com.example.to_do_app',
        messagingSenderId: '494923511027',
        projectId: 'newtodoapp-3f210'
    )
  )

  :
  await Firebase.initializeApp();
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
