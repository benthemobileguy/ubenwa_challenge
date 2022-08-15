import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ubenwa_challenge/authentication/signup/bloc/signup_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator(color: Color(0xffF9923B))
            : ElevatedButton(
          key: const Key('signUpForm_continue_raisedButton'),
          style: ElevatedButton.styleFrom(primary:const Color(0xffF9923B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding:  const EdgeInsets.symmetric(horizontal: 40, vertical: 12)),
          onPressed: state.status.isValidated
              ? () {
            context.read<SignUpBloc>().add(const SignUpSubmitted());
          } : null,
          child: const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF)),
          ),
        );
      },
    );
  }
}