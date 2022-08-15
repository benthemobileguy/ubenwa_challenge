import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubenwa_challenge/authentication/signup/bloc/signup_bloc.dart';
import 'package:ubenwa_challenge/authentication/widgets/form-helper.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscurePasswordText = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return formHelper('........', obscurePasswordText,
            onChanged: (password) =>
                context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
            errorText: state.password.invalid ? 'Passwords must contain at a least a dot and comma' : null,
            suffixIcon: IconButton(
                icon: Icon(
                  obscurePasswordText ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: const Color(0xff88879C),
                ),
                onPressed: () {
                  setState(() {
                    obscurePasswordText = !obscurePasswordText;
                  });
                }));
      },
    );
  }
}

