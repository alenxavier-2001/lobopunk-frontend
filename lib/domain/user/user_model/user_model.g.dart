// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      phonenumber: json['phonenumber'] as String?,
      profileimage: json['profileimage'] as String?,
      isverified: json['isverified'] as bool?,
      socailmedialinks: json['socailmedialinks'] as List<dynamic>?,
      punkers: json['punkers'] as List<dynamic>?,
      punking: json['punking'] as List<dynamic>?,
      profiletheme: json['profiletheme'] as String?,
      thememusic: json['thememusic'] as String?,
      totallikes: json['totallikes'] as int?,
      likedposts: json['likedposts'] as List<dynamic>?,
      savedposts: json['savedposts'] as List<dynamic>?,
      myposts: json['myposts'] as List<dynamic>?,
      notification: json['notification'] as List<dynamic>?,
      id: json['_id'] as String?,
      report: json['report'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'bio': instance.bio,
      'phonenumber': instance.phonenumber,
      'profileimage': instance.profileimage,
      'isverified': instance.isverified,
      'socailmedialinks': instance.socailmedialinks,
      'punkers': instance.punkers,
      'punking': instance.punking,
      'profiletheme': instance.profiletheme,
      'thememusic': instance.thememusic,
      'totallikes': instance.totallikes,
      'likedposts': instance.likedposts,
      'savedposts': instance.savedposts,
      'myposts': instance.myposts,
      'notification': instance.notification,
      '_id': instance.id,
      'report': instance.report,
    };
