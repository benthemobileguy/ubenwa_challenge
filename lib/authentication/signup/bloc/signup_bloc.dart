import 'dart:convert';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:ubenwa_challenge/authentication/login/models/password.dart';
import 'package:ubenwa_challenge/authentication/login/models/username.dart';
import 'package:ubenwa_challenge/newborn/data/session-manager.dart';

import '../../login/models/email.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const SignUpState()) {
    on<SignUpUsernameChanged>(_onUsernameChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    SignUpUsernameChanged event,
    Emitter<SignUpState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([state.username, username]),
    ));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.password]),
    ));
  }

  void _onEmailChanged(
      SignUpEmailChanged event,
      Emitter<SignUpState> emit,
      ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.email]),
    ));
  }
  void _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final res = await _authenticationRepository.signUp(
          username: state.email.value,
          password: state.password.value,
          email: state.email.value,
        );
        if(res.statusCode == 200){
          final Map<String, dynamic> data = json.decode(res.body);
          //Save token to local storage
          SessionManager().authToken = data['token'];
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        }else{
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
}
