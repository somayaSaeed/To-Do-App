import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/UI/Register_Login/LoginScreen.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

import '../../Utils/CustomTextForm.dart';
import '../../Utils/Custom Button.dart';

class RegisterScreen extends StatelessWidget {
  static String routName = 'sign-up-screen';

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();


  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height*0.1,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Create an account',
            style: TextStyle(
              fontSize: 25,
              color: ColorResources.babyBlue,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:  height* 0.03,
                  ),
                  Text(
                    'User Name',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  CustomTextForm(
                    controller: nameController,
                    validator: (text) {},
                  ),
                  Text(
                    'E-mail',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  CustomTextForm(
                    controller: emailController,

                    validator: (text) {},
                  ),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  CustomTextForm(
                    controller: passwordController,

                    validator: (text) {},
                  ),
                  Text(
                    'Retype-Password',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  CustomTextForm(
                    controller: confirmPasswordController,

                    validator: (text) {

                    },
                  ),
                  SizedBox(height: height*0.04,),
                  customBottom(
                    onTap: () {

                    },
                    text: 'Sign Up',
                    bgColor1: ColorResources.babyBlue,
                    bgColor2: ColorResources.primaryLightColor,
                    textColor: ColorResources.blackText,
                  ) ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have an account? ",
                        style: TextStyle(
                            color: ColorResources.bgDarkColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) =>   LoginScreen ()));                        },
                        child: Text(
                          "SignIn",
                          style: TextStyle(
                              color: ColorResources.babyBlue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
