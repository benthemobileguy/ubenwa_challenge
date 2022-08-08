import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubenwa_challenge/authentication/login/bloc/login_bloc.dart';
import 'package:ubenwa_challenge/authentication/widgets/form-helper.dart';
class PasswordInput extends StatelessWidget {
  bool obscurePasswordText = true;

  PasswordInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return formHelper('........', obscurePasswordText,
            validator: (password) {
              Pattern pattern =
                  r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
              RegExp regex = RegExp(pattern.toString());
              if (!regex.hasMatch(password!)) {
                return 'Password should be 6 characters including\nlowercase and uppercase letters and at\nleast a symbol';
              } else {
                return null;
              }
            },
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
            errorText: state.password.invalid ? 'invalid password' : null,
            suffixIcon: IconButton(
                icon: Icon(
                  obscurePasswordText ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: const Color(0xff88879C),
                ),
                onPressed: () {
                  // setState(() {
                  //   obscurePasswordText = !obscurePasswordText;
                  // });
                }));
      },
    );
  }
}
