import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Core/Local/firebase_utlis.dart';
import 'package:to_do_app/Core/Model/user%20model.dart';
import 'package:to_do_app/Core/Provider/auth%20user%20provider.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

import '../../Core/Local/DialogUtils.dart';
import '../../Utils/CustomTextForm.dart';
import '../../Utils/Custom Button.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  static String routName = 'sign-up-screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController =
      TextEditingController();

  TextEditingController confirmPasswordController =
      TextEditingController();

  TextEditingController passwordController =
      TextEditingController();

  var formKey = GlobalKey<FormState>();
  late AuthUserProvider authUserProvider ;

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
                'Create\nan account',
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
                'User Name',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              CustomTextForm(
                controller: nameController,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
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
              Text(
                'Retype-Password',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              CustomTextForm(
                controller: confirmPasswordController,
                obscureText: true,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter your Password';
                  }
                  if (text != passwordController.text) {
                    return 'Please make sure your passwords match.';
                  }

                  return null;
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              customBottom(
                onTap: () {
                  register();
                },
                text: 'Sign Up',
                bgColor1: ColorResources.babyBlue,
                bgColor2: ColorResources.primaryLightColor,
                textColor: ColorResources.blackText,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have an account? ",
                      style: TextStyle(
                          color: ColorResources.gray,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => const LoginScreen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: ColorResources.babyBlue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void register() async {
    if (formKey.currentState?.validate() == true) {
      //todo: show loading
      DialogUtils.showLoading(context: context, message: 'Loading...');

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        MyUser myUser = MyUser(
            id: credential.user?.uid ?? '',
            name: nameController.text,
            email: emailController.text
        ,);
        authUserProvider.updateUser(myUser);

        await FirebaseUtils.addUserToFireStore(
          myUser,
        );
        //todo: hide loading
        DialogUtils.hideLoading(context);

        //todo: show message
        DialogUtils.showMessage(
          context: context,
          message: 'Registration successful! You can now log in.',
          title: 'Success',
          posActiveName: 'Ok',
          posAction: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        );

        print(credential.user?.uid ?? '');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          //todo: hide loading
          DialogUtils.hideLoading(context);

          //todo: show message
          DialogUtils.showMessage(
              context: context,
              title: 'Error',
              posActiveName: 'Ok',
              message: 'The password provided is too weak.');

          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          //todo: hide loading
          DialogUtils.hideLoading(context);

          //todo: show message
          DialogUtils.showMessage(
              context: context,
              posActiveName: 'Ok',
              title: 'Error',
              message: 'The account already exists for that email.');
          print('The account already exists for that email.');
        }
      } catch (e) {
        //todo: hide loading
        DialogUtils.hideLoading(context);

        //todo: show message
        DialogUtils.showMessage(
            context: context,
            message: e.toString(),
            posActiveName: 'Ok',
            title: 'Error');

        print(e);
      }
    }
  }
}

// posAction: (){
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginScreen()),
//                 );
//               },
