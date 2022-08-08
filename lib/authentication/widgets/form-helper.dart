import 'package:flutter/material.dart';

Widget formHelper(String hintText, bool obscure,
    {IconButton? suffixIcon,ValueChanged<String>? onChanged, Key? key, String? errorText, String? Function(String?)? validator}) {
  return TextFormField(
    obscureText: obscure,
    key: key,
    maxLines: 1,
    onChanged: onChanged,
    cursorColor:  const Color(0xff333E63),
    validator: validator,
    decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: const Color(0xffCCD2E3),
        contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xff88879C)),
        fillColor: const Color(0xffE6E6E6),
        errorText: errorText,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        )),
  );
}