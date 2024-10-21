import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final int? maxLines;
  const TextForm({super.key, this.controller, this.validator,this.obscureText = false, this.suffixIcon, this.hintText, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
          hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.all(15.w),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide:
                  const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide:
                  const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(color: Colors.red)),
          hintText: hintText,
          alignLabelWithHint: true),
      validator: validator,
      maxLines: maxLines,
    );
  }
}
