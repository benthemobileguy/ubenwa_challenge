import 'package:flutter/material.dart';
import 'package:ubenwa_challenge/authentication/signup/view/signup_page.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 14),
        alignment: Alignment.bottomCenter,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Already have an account? ',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xfff88879c))),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage())),
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 11,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffF9923B)),
                ),
              )
            ]));
  }
}