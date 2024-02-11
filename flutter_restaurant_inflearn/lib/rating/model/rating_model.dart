import 'package:flutter_restaurant_inflearn/common/model/model_with_id.dart';
import 'package:flutter_restaurant_inflearn/common/utils/data_utils.dart';
import 'package:flutter_restaurant_inflearn/user/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel implements IModelWithId {
  final String id;
  final UserModel user;
  final int rating;
  final String content;
  @JsonKey(
    fromJson: DataUtils.listPathsToUrls
  )
  final List<String> imgUrls;

  RatingModel(this.id, this.user, this.rating, this.content, this.imgUrls);

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);
}