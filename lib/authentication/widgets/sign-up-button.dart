import 'package:flutter/material.dart';
import 'package:ubenwa_challenge/authentication/login/view/login_page.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
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
              const Text('Dont have an account? ',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xfff88879c))),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage())),
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
