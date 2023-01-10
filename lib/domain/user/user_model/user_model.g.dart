// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      favaccounts: json['favaccounts'] as List<dynamic>?,
      favhashtags: json['favhashtags'] as List<dynamic>?,
      reposts: json['reposts'] as List<dynamic>?,
      repostsentrequests: json['repostsentrequests'] as List<dynamic>?,
      repostreceivedrequests: json['repostreceivedrequests'] as List<dynamic>?,
      id: json['_id'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      bio: json['bio'] as String?,
      phonenumber: json['phonenumber'] as String?,
      profileimage: json['profileimage'] as String?,
      socailmedialinks: (json['socailmedialinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      punkers:
          (json['punkers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      punking:
          (json['punking'] as List<dynamic>?)?.map((e) => e as String).toList(),
      profiletheme: json['profiletheme'] as String?,
      thememusic: json['thememusic'] as String?,
      totallikes: json['totallikes'] as int?,
      likedposts: (json['likedposts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      savedposts: json['savedposts'] as List<dynamic>?,
      myposts:
          (json['myposts'] as List<dynamic>?)?.map((e) => e as String).toList(),
      notification: json['notification'] as List<dynamic>?,
      report: json['report'] as List<dynamic>?,
      v: json['__v'] as int?,
      isverified: json['isverified'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'favaccounts': instance.favaccounts,
      'favhashtags': instance.favhashtags,
      'reposts': instance.reposts,
      'repostsentrequests': instance.repostsentrequests,
      'repostreceivedrequests': instance.repostreceivedrequests,
      '_id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'bio': instance.bio,
      'phonenumber': instance.phonenumber,
      'profileimage': instance.profileimage,
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
      'report': instance.report,
      '__v': instance.v,
      'isverified': instance.isverified,
    };
