import 'package:json_annotation/json_annotation.dart';
import 'package:pan_code_test/core/data/model/response/user_model.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  final String? id;
  final String? message;
  final UserModel? owner;
  final String? post;
  final DateTime? publishDate;

  CommentModel({
    this.id,
    this.message,
    this.owner,
    this.post,
    this.publishDate,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}