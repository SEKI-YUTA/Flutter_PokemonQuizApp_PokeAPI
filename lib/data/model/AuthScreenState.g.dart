// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthScreenState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthScreenStateImpl _$$AuthScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthScreenStateImpl(
      isLoginMode: json['isLoginMode'] as bool? ?? true,
      isLoading: json['isLoading'] as bool? ?? false,
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      errorMessage: json['errorMessage'] as String? ?? "",
      isPasswordVisible: json['isPasswordVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$$AuthScreenStateImplToJson(
        _$AuthScreenStateImpl instance) =>
    <String, dynamic>{
      'isLoginMode': instance.isLoginMode,
      'isLoading': instance.isLoading,
      'email': instance.email,
      'password': instance.password,
      'errorMessage': instance.errorMessage,
      'isPasswordVisible': instance.isPasswordVisible,
    };
