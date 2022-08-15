part of 'signup_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final Email email;
  final Username username;
  final Password password;

  SignUpState copyWith({
    FormzStatus? status,
    Email? email,
    Username? username,
    Password? password,
  }) {
    return SignUpState(
      username: username ?? this.username,
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, email, username, password];
}
