import 'package:formz/formz.dart';

enum EmailInputError {
  empty,
  invalid,
}

// Extend FormzInput and provide the input type and error type.
class EmailInput extends FormzInput<String, EmailInputError> {
  EmailInput.pure([super.value = '']) : super.pure();

  EmailInput.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  // Override validator to handle validating a given input value.
  @override
  EmailInputError? validator(String value) {
    return value.isEmpty
        ? EmailInputError.empty
        : _emailRegExp.hasMatch(value)
            ? null
            : EmailInputError.invalid;
  }
}
