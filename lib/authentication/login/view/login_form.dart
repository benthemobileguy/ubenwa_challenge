import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ubenwa_challenge/authentication/login/bloc/login_bloc.dart';
import 'package:ubenwa_challenge/authentication/widgets/floating-text.dart';
import 'package:ubenwa_challenge/authentication/widgets/forgot-password.dart';
import 'package:ubenwa_challenge/authentication/widgets/login-button.dart';
import 'package:ubenwa_challenge/authentication/widgets/login-text.dart';
import 'package:ubenwa_challenge/authentication/widgets/password-input.dart';
import 'package:ubenwa_challenge/authentication/widgets/sign-up-button.dart';
import 'package:ubenwa_challenge/authentication/widgets/username-input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
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
              const HeaderText(title: "Login"),
              const FloatingText(title: 'Email'),
              const UsernameInput(),
              const Padding(padding: EdgeInsets.all(12)),
              const FloatingText(title: 'Password'),
              PasswordInput(),
              const Padding(padding: EdgeInsets.all(12)),
              const ForgotPassword(),
              const SizedBox(
                height: 20,
              ),
              const CustomButton(title: "Login"),
              const SizedBox(
                height: 50,
              ),
              const SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

