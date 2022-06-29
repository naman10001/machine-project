import 'package:flutter/material.dart';
import 'package:machine/Src/Constant/color_const.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    this.controller,
    this.obscureText = false,
    this.labelText,
    this.onChanged,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? labelText;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText ?? false,
      textInputAction: TextInputAction.done,
      cursorColor: ColorConst.black,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: ColorConst.black),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorConst.black),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorConst.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
