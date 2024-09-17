import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

import '../../Utils/CustomTextForm.dart';
import '../../Utils/Custom Button.dart';
import 'Register Screen.dart';

class Loginscreen extends StatelessWidget {
  static String routName = 'log-in-screen';

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.05,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome\nBack!',
                    style: GoogleFonts.rubik(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: ColorResources.babyBlue,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    'E-mail',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  CustomTextForm(
                    controller: emailController,
                    keyBordType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter your Email';
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return 'Please enter valid Email.';
                      }
                      return null;
                    },
                  ),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  CustomTextForm(
                    controller: passwordController,
                    keyBordType: TextInputType.text,
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter your Password';
                      }
                      if (text.length < 6) {
                        return 'Password should be at least 6 character';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  customBottom(
                    onTap: () {
                      login();
                    },
                    text: 'Login',
                    bgColor1: ColorResources.babyBlue,
                    bgColor2: ColorResources.primaryLightColor,
                    textColor: ColorResources.blackText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => RegisterScreen()));
                        },
                        child: Text(
                          "Or Create account",
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

  void login() {
    if (formKey.currentState?.validate() == true) {}
  }
}
