import 'package:easy_localization/easy_localization.dart';

import '../constants/localization_constants.dart';

abstract class ErrorParser {
  String getMessage(Map<String, dynamic>? json);
}

class ApiResponseError implements ErrorParser {

  @override
  String getMessage(Map<String, dynamic>? json) {

    if(json == null) {
      return strUnknownError.tr();
    }

    try {
      if(json['errors'] == null ? (json['status'] == null || json['message'] == null) : false) {
        return strUnknownError.tr();
      }

      if(json['status'] != null && !json['status'] && json['message'] is String) {
        return json['message'];
      }

      if(json['status'] != null && !json['status'] && json['message'] is Map) {
        var keys = (json['message'] as Map<String, dynamic>).keys;

        if(keys.isNotEmpty && json['message'][keys.first] is List && json['message'][keys.first].isNotEmpty) {
          return json['message'][keys.first][0].toString();
        }
      }

      if(json['errors'] != null && json['errors'] is Map) {
        var keys = (json['errors'] as Map<String, dynamic>).keys;

        if(keys.isNotEmpty && json['errors'][keys.first] is List && json['errors'][keys.first].isNotEmpty) {
          return json['errors'][keys.first][0].toString();
        }
      }

    } catch(error) {
      return strUnknownError.tr();
    }

    return strUnknownError.tr();
  }
}