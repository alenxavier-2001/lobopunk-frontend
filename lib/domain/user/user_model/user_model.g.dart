// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phonenumber: json['phonenumber'] as String?,
      profileimage: json['profileimage'] as String?,
      subscribers: json['subscribers'] as List<dynamic>?,
      subscribed: json['subscribed'] as List<dynamic>?,
      likedposts: json['likedposts'] as List<dynamic>?,
      savedposts: json['savedposts'] as List<dynamic>?,
      myposts: json['myposts'] as List<dynamic>?,
      notification: json['notification'] as List<dynamic>?,
      id: json['_id'] as String?,
      report: json['report'] as List<dynamic>?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phonenumber': instance.phonenumber,
      'profileimage': instance.profileimage,
      'subscribers': instance.subscribers,
      'subscribed': instance.subscribed,
      'likedposts': instance.likedposts,
      'savedposts': instance.savedposts,
      'myposts': instance.myposts,
      'notification': instance.notification,
      '_id': instance.id,
      'report': instance.report,
      '__v': instance.v,
    };
