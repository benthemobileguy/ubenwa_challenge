import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubenwa_challenge/authentication/signup/bloc/signup_bloc.dart';
import 'package:ubenwa_challenge/authentication/widgets/form-helper.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return  formHelper('example@gmail.com', false,
          key: const Key('signUpForm_emailInput_textField'),
          errorText: state.email.invalid ? 'invalid email' : null,
          onChanged: (email) =>
              context.read<SignUpBloc>().add(SignUpEmailChanged(email)));
      },
    );
  }
}