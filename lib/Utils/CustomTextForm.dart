import 'package:flutter/material.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

class CustomTextForm extends StatelessWidget {
  TextInputType keyBordType;
  String label;
  String hintText;
  bool obscureText;
  TextEditingController controller;
  final String? Function(String?) validator;

  CustomTextForm(
      {super.key,
      this.label = '',
      this.hintText = '',
      this.obscureText = false,
      required this.validator,
      required this.controller,
      this.keyBordType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w100,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorResources.babyBlue,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorResources.green,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorResources.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorResources.red,
              width: 2,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            color: ColorResources.lightGray,
          ),
        ),
        validator: validator,
        keyboardType: keyBordType,
        controller: controller,
        obscureText: obscureText,
      ),
    );
  }
}
