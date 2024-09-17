import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Core/Provider/list%20provider.dart';
import 'package:to_do_app/UI/Board/Board%20Screen.dart';
import 'UI/Home/home_Screen.dart';
import 'UI/Register_Login/LoginScreen.dart';
import 'UI/Register_Login/Register Screen.dart';
import 'Utils/Theme/Theme.dart';
import 'package:provider/provider.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
    options:  const FirebaseOptions(
        apiKey: 'AIzaSyA1IXO_sjLH_Gy5BH0VI8TEspLA0x-1S8o',
        appId: 'com.example.to_do_app',
        messagingSenderId: '494923511027',
        projectId: 'newtodoapp-3f210'
    )
  )

  :
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
    create:(context) => ListProvider(),
      child: const ToDoApp()));
}
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Loginscreen.routName ,
      theme: MyThemeData.lightMode,

      routes: {
        SplashScreen.routName : (context) =>   const SplashScreen(),
        HomeScreen.routName : (context) =>   const HomeScreen(),
        RegisterScreen.routName : (context) =>   RegisterScreen(),
        Loginscreen.routName : (context) =>   Loginscreen(),



      },
    );
  }
}
