// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:webullish/utils/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final Function validator;
  TextInputType? keyboardType;
  int? maxLines;
  // String? labelText;
  String? hintText;
  Widget? suffixIcon;
  bool? obscureText;
  String? initialValue;
  MyTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    // required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.maxLines,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: AppColors.whiteColor,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ),
      maxLines: maxLines,
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      initialValue: initialValue,
      textAlignVertical: TextAlignVertical.center,
      validator: (value) => validator(value),
      decoration: InputDecoration(

        // labelText: labelText,
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        // contentPadding: EdgeInsets.all(15),
        //contentPadding: const EdgeInsets.from
        //(20.0, 20.0, 20.0, 5.0),
        // alignLabelWithHint: true,

        hintStyle:  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
          color: AppColors.grey,
        ),
        errorStyle:
        TextStyle(fontSize: 18.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        //fillColor: Colors.grey.shade200,
        fillColor: Colors.transparent,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
          //borderSide: const BorderSide(color: Colors.white),
          borderSide:  BorderSide(
              color: AppColors.ancientColor, width: 2),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
           borderSide:  BorderSide(
              color: AppColors.ancientColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
           borderSide:  BorderSide(
              color: AppColors.ancientColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
           borderSide:  BorderSide(
              color: AppColors.ancientColor, width: 2),
        ),
      ),
    );
  }
}
