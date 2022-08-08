import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ubenwa_challenge/authentication/login/bloc/login_bloc.dart';
import 'package:ubenwa_challenge/authentication/widgets/floating-text.dart';
import 'package:ubenwa_challenge/authentication/widgets/forgot-password.dart';
import 'package:ubenwa_challenge/authentication/widgets/log-in-button.dart';
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
              const SnackBar(content: Text('Wrong email or password')),
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
            children: const [
              HeaderText(title: "Login"),
              FloatingText(title: 'Email'),
              UsernameInput(),
              Padding(padding: EdgeInsets.all(12)),
              FloatingText(title: 'Password'),
              PasswordInput(),
              Padding(padding: EdgeInsets.all(12)),
              ForgotPassword(),
              SizedBox(
                height: 20,
              ),
              CustomButton(),
              SizedBox(
                height: 50,
              ),
              LogInButton(),
            ],
          ),
        ),
      ),
    );
  }
}

