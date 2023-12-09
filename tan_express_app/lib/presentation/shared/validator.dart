import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../l10n/l10n.dart';

class Validator {
  const Validator.of(this._context);

  final BuildContext _context;

  String? validateEmptyField(String? value) => value == null || value.isEmpty
      ? L10n.of(_context).tr.errorFieldRequired
      : null;

  String? validateFullName(String? value) => validateEmptyField(value);

  String? validateEmail(String? value) {
    final String? valid = validateEmptyField(value);
    if (valid != null) {
      return valid;
    }
    if (!EmailValidator.validate(value ?? '')) {
      return L10n.of(_context).tr.errorInvalidEmail;
    }
    return null;
  }

  String? validatePhoneNumber(PhoneNumber? phoneNumber) {
    if (phoneNumber?.isValid() == false) {
      return L10n.of(_context).tr.errorInvalidPhoneNumber;
    }
    return null;
  }
}
