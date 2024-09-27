import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Core/Local/firebase_utlis.dart';
import 'package:to_do_app/Core/Model/user%20model.dart';
import 'package:to_do_app/UI/Home/home_Screen.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

import '../../Core/Local/DialogUtils.dart';
import '../../Core/Provider/auth user provider.dart';
import '../../Utils/CustomTextForm.dart';
import '../../Utils/Custom Button.dart';
import 'Register Screen.dart';

class LoginScreen extends StatefulWidget {
  static String routName = 'log-in-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthUserProvider authUserProvider;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    authUserProvider = Provider.of<AuthUserProvider>(context);

    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: height * 0.025, vertical: width * 0.1),
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
                SizedBox(height: height * 0.04),
                Text('E-mail', style: Theme.of(context).textTheme.labelLarge),
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
                Text('Password', style: Theme.of(context).textTheme.labelLarge),
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
                SizedBox(height: height * 0.03),
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
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => const RegisterScreen(),
                          ),
                          (route) => false,
                        );
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
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showMessage(
        context: context,
        message: 'Loading...',
      );

      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        var user = await FirebaseUtils.readUserFromFireStore(
          credential.user?.uid ?? '',
        );

        if (user == null) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            title: 'Error',
            message: 'User not found. Please register first.',
            posActiveName: 'Ok',
          );
          return;
        }

        authUserProvider.updateUser(user);
        DialogUtils.hideLoading(context);

        DialogUtils.showMessage(
          context: context,
          title: 'Success',
          message: 'Login Successful.',
          posActiveName: 'Ok',
          posAction: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          title: 'Error',
          message: 'Email or password is incorrect.',
          posActiveName: 'Ok',
        );
      } catch (e) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          title: 'Error',
          message: e.toString(),
          posActiveName: 'Ok',
        );
      }
    }
  }
}
