import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 1, top: 10),
      alignment: Alignment.centerRight,
      child: const Text(
        'forgot password?',
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Color(0xffF9923B)),
      ),
    );
  }
}