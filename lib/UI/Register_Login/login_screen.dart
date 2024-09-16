import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

import '../../Utils/CustomTextForm.dart';

class LoginScreen extends StatelessWidget {
  static String routName = 'login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 20,
            color: ColorResources.bgDarkColor,
            fontWeight: FontWeight.w300,
          ),
        ),

      ),
      body:Column(

        children: [
          CustomTextForm(),
          Spacer(),
          CustomTextForm(),
          Spacer(),
          CustomTextForm(),
          Spacer(),
          CustomTextForm(),

        ],
      )
    );
  }
}
