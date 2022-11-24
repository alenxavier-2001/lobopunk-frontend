import 'package:json_annotation/json_annotation.dart';

part 'server_error_model.g.dart';

@JsonSerializable()
class ServerErrorModel {
  String? msg;

  ServerErrorModel({this.msg});

  factory ServerErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ServerErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServerErrorModelToJson(this);
}
