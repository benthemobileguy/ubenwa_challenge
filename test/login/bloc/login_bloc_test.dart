import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ubenwa_challenge/authentication/login/bloc/login_bloc.dart';
import 'package:ubenwa_challenge/authentication/login/models/email.dart';
import 'package:ubenwa_challenge/authentication/login/models/password.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
  });

  group('LoginBloc', () {
    test('initial state is LoginState', () {
      final loginBloc = LoginBloc(
        authenticationRepository: authenticationRepository,
      );
      expect(loginBloc.state, const LoginState());
    });

    group('LoginSubmitted', () {
      blocTest<LoginBloc, LoginState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when login succeeds',
        setUp: () {
          when(
            () => authenticationRepository.logIn(
              username: 'email',
              password: 'password',
            ),
          ).thenAnswer((_) => Future.value());
        },
        build: () => LoginBloc(
          authenticationRepository: authenticationRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const LoginUsernameChanged('email'))
            ..add(const LoginPasswordChanged('password'))
            ..add(const LoginSubmitted());
        },
        expect: () => const <LoginState>[
          LoginState(
            email: Email.dirty('email'),
            status: FormzStatus.invalid,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.valid,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.submissionInProgress,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.submissionSuccess,
          ),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'emits [LoginInProgress, LoginFailure] when logIn fails',
        setUp: () {
          when(
            () => authenticationRepository.logIn(
              password: 'password',
              username: 'email',
            ),
          ).thenThrow(Exception('oops'));
        },
        build: () => LoginBloc(
          authenticationRepository: authenticationRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const LoginUsernameChanged('email'))
            ..add(const LoginPasswordChanged('password'))
            ..add(const LoginSubmitted());
        },
        expect: () => const <LoginState>[
          LoginState(
            email: Email.dirty('email'),
            status: FormzStatus.invalid,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.valid,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.submissionInProgress,
          ),
          LoginState(
            email: Email.dirty('email'),
            password: Password.dirty('password'),
            status: FormzStatus.submissionFailure,
          ),
        ],
      );
    });
  });
}
