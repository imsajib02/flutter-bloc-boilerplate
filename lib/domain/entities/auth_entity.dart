import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class AuthEntity extends HiveObject {

  @HiveField(0)
  final String? accessToken;

  @HiveField(1)
  final String? tokenType;

  AuthEntity({this.accessToken, this.tokenType});

  factory AuthEntity.fromJson(Map<String, dynamic> json) => AuthEntity(
    accessToken: json['access_token'] as String?,
    tokenType: json['token_type'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'token_type': tokenType,
  };

  String get keyWithToken => '$tokenType $accessToken';
}