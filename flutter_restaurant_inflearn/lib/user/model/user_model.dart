
import 'package:flutter_restaurant_inflearn/common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String username;
  @JsonKey(fromJson: DataUtils.pathToUrl)
  final String imageUrl;

  UserModel(this.id, this.username, this.imageUrl);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}