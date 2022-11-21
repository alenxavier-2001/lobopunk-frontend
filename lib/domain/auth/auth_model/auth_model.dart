import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  String? token;
  String? username;
  String? name;
  String? email;
  String? password;
  String? phonenumber;
  @JsonKey(name: '_id')
  String? id;
  List<dynamic>? report;
  @JsonKey(name: '__v')
  int? v;

  AuthModel({
    this.token,
    this.username,
    this.name,
    this.email,
    this.password,
    this.phonenumber,
    this.id,
    this.report,
    this.v,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return _$AuthModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
