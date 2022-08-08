import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ubenwa_challenge/authentication/signup/bloc/signup_bloc.dart';
import 'package:ubenwa_challenge/authentication/widgets/floating-text.dart';
import 'package:ubenwa_challenge/authentication/widgets/log-in-button.dart';
import 'package:ubenwa_challenge/authentication/widgets/login-button.dart';
import 'package:ubenwa_challenge/authentication/widgets/login-text.dart';
import 'package:ubenwa_challenge/authentication/widgets/password-input.dart';
import 'package:ubenwa_challenge/authentication/widgets/username-input.dart';

class SignUpPage extends StatelessWidget {

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
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
            children: [
              const HeaderText(title: "SignUp"),
              const FloatingText(title: 'Name'),
              const UsernameInput(),
              const Padding(padding: EdgeInsets.all(12)),
              const FloatingText(title: 'Email'),
              PasswordInput(),
              const Padding(padding: EdgeInsets.all(12)),
              const SizedBox(
                height: 20,
              ),
              const CustomButton(title: "Sign Up"),
              const SizedBox(
                height: 50,
              ),
              const LogInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
