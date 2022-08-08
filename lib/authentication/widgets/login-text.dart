import 'package:flutter/material.dart';
class LoginText extends StatelessWidget {
  const LoginText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login',
      style: TextStyle(
          fontSize: 18.5,
          fontWeight: FontWeight.w700,
          color: Color(0xff333E63)),
    );
  }
}