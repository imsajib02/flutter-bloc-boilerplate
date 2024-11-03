import '../../../core/abstractions/entity_convertible.dart';
import '../../../domain/entities/auth_entity.dart';

part 'auth_mapper.dart';

class AuthModel implements EntityConvertible<AuthModel, AuthEntity> {

  final String? accessToken;
  final String? tokenType;

  const AuthModel({this.accessToken, this.tokenType});

  @override
  AuthModel fromEntity(AuthEntity entity) => throw UnimplementedError();

  @override
  AuthEntity toEntity() => AuthEntity(
    accessToken: accessToken,
    tokenType: tokenType,
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}