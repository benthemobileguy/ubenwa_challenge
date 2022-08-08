import 'package:flutter/material.dart';
import 'package:ubenwa_challenge/authentication/signup/view/widgets/custom-button.dart';
import 'package:ubenwa_challenge/authentication/signup/view/widgets/password-input.dart';
import 'package:ubenwa_challenge/authentication/signup/view/widgets/email-input.dart';
import 'package:ubenwa_challenge/authentication/signup/view/widgets/terms-of-service.dart';
import 'package:ubenwa_challenge/authentication/signup/view/widgets/username-input.dart';
import 'package:ubenwa_challenge/authentication/widgets/floating-text.dart';
import 'package:ubenwa_challenge/authentication/widgets/login-text.dart';
import 'package:ubenwa_challenge/authentication/widgets/sign-up-button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Container(
        padding:
        const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            border: Border.all(width: 2, color: const Color(0xffFBF5FF)),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            HeaderText(title: "SignUp"),
            FloatingText(title: 'Name'),
            UsernameInput(),
            Padding(padding: EdgeInsets.all(10)),
            FloatingText(title: 'Email'),
            EmailInput(),
            Padding(padding: EdgeInsets.all(10)),
            FloatingText(title: 'Password'),
            PasswordInput(),
            TermsOfService(),
            CustomButton(),
            SizedBox(
              height: 30,
            ),
            SignUpButton(),
          ],
        ),
      ),
    );
  }
}