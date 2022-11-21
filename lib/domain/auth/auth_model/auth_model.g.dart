// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      token: json['token'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phonenumber: json['phonenumber'] as String?,
      id: json['_id'] as String?,
      report: json['report'] as List<dynamic>?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phonenumber': instance.phonenumber,
      '_id': instance.id,
      'report': instance.report,
      '__v': instance.v,
    };
