// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupParam _$SignupParamFromJson(Map<String, dynamic> json) => SignupParam(
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as int,
    );

Map<String, dynamic> _$SignupParamToJson(SignupParam instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
    };
