import 'package:easy_localization/easy_localization.dart';

import '../constants/localization_constants.dart';

mixin ValidatorMixin {

  String? requiredValidation(String? value) {

    if(value == null || value.isEmpty) {
      return strRequiredField.tr();
    }

    return null;
  }

  String? passwordValidation(String? value) {

    var result = requiredValidation(value);

    if(result != null) {
      return result;
    }

    // Password length will be validated on server side
    /*if(value!.length < minPasswordLength) {
      return strPasswordLengthValidation.trPluralParams(strPasswordLengthValidationPlural, minPasswordLength,
          {'length': minPasswordLength.toString()});
    }*/

    return null;
  }

  String? passwordConfirmationValidation(String? value, String? password) {

    var result = passwordValidation(value);

    if(result != null) {
      return result;
    }

    if(password == null || password.isEmpty) {
      return null;
    }

    if(value != password) {
      return strPasswordMismatchValidation.tr();
    }

    return null;
  }
}