import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ubenwa_challenge/authentication/login/bloc/login_bloc.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          style: ElevatedButton.styleFrom(primary:const Color(0xffF9923B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding:  const EdgeInsets.symmetric(horizontal: 40, vertical: 12)),
          onPressed: state.status.isValidated
              ? () {
            context.read<LoginBloc>().add(const LoginSubmitted());
          }
              : null,
          child: Text(
            title!,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF)),
          ),
        );
      },
    );
  }
}