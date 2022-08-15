import 'package:formz/formz.dart';
import 'package:email_validator/email_validator.dart';

enum EmailValidationError { empty }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return value?.isNotEmpty == true && EmailValidator.validate(value!) ? null : EmailValidationError.empty;
  }
}
