import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ubenwa_challenge/authentication/signup/bloc/signup_bloc.dart';
import 'package:ubenwa_challenge/authentication/signup/view/signup-form.dart';

class SignUpPage extends StatelessWidget {

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW  = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFBF8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocProvider(
          create: (BuildContext context) {
            return SignUpBloc(
              authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: BlocListener<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Email has already been taken')),
                  );
              }
            },
            child: SizedBox(
              height: deviceH,
              width: deviceW,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: deviceH / 10),
                    child: const Text(
                      'Test App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff333E63)),
                    ),
                  ),
                  const SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
