import 'package:flutter/material.dart';

const Locale localeEnglish = Locale('en', 'US');
const Locale localeBangla = Locale('bn', 'BD');

const List<({String name, String shortName, Locale locale})> appLocales = [
  (name: 'বাংলা', shortName: 'বাং', locale: localeBangla),
  (name: 'English', shortName: 'En', locale: localeEnglish),
];

const strAppName = 'app_name';
const strMyTodoList = 'my_todo_list';
const strVersion = 'version';
const strRequiredField = 'required_field';
const strPasswordLengthValidation = 'password_length_validation';
const strPasswordLengthValidationPlural = 'password_length_validation_plural';
const strPasswordMismatchValidation = 'password_mismatch_validation';
const strNoInternet = 'no_internet';
const strInactiveConnection = 'inactive_connection';
const strTimedOut = 'timed_out';
const strSomethingWrong = 'something_wrong';
const strUnknownError = 'unknown_error';
const strSuccess = 'success';
const strFailed = 'failed';
const strYes = 'yes';
const strNo = 'no';
const strTryAgain = 'try_again';
const strOops = 'oops';
const strDataLoadFailure = 'data_load_failure';
const strNoData = 'no_data_found';
const strUpdateAvailable = 'update_available';
const strUpdateDescription = 'update_description';