part of 'auth_model.dart';

AuthModel _$fromJson(Map<String, dynamic> json) => AuthModel(
  accessToken: json['access_token'] as String?,
  tokenType: json['token_type'] as String?,
);

@override
Map<String, dynamic> _$toJson(AuthModel model) => {
  'access_token': model.accessToken,
  'token_type': model.tokenType,
};