import 'package:flutter/material.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

class CustomTextForm extends StatelessWidget {
  TextInputType keyBordType ;
  String label;
  String hintText ;
  TextEditingController controller;
  final String? Function(String?) validator;

  CustomTextForm({
    super.key,
    this.label ='',
    this.hintText = '',
    required this.validator,
    required this.controller,
    this.keyBordType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Stack(
        children: [
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  ColorResources.babyBlue,
                  ColorResources.darkBlueText,
                ],
              ),
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.transparent,
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
                  hintStyle: TextStyle(fontSize: 15 , color: ColorResources.lightGray)
                ),

                validator: validator,
                keyboardType: keyBordType,
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
