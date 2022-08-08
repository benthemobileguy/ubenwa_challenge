import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubenwa_challenge/authentication/login/bloc/login_bloc.dart';
import 'package:ubenwa_challenge/authentication/widgets/form-helper.dart';
class UsernameInput extends StatelessWidget {
  const UsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return  formHelper('example@gmail.com', false,
          key: const Key('loginForm_usernameInput_textField'),
          errorText: state.username.invalid ? 'invalid username' : null,
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'email is required';
            }
            if (!RegExp(
                "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                .hasMatch(value)) {
              return 'Please input a valid email address';
            }
            return null;
          },);
      },
    );
  }
}