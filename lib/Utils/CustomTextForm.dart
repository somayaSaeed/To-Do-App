import 'package:flutter/material.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: ColorResources.babyBlue,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: ColorResources.babyBlue,
            width: 2,
          ),
        ),
      ),
    );
  }
}
