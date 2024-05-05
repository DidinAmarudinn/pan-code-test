import 'package:json_annotation/json_annotation.dart';
import 'package:pan_code_test/core/data/model/response/user_model.dart';
import 'package:pan_code_test/core/domain/entity/post_entity.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final String? id;
  final String? image;
  final int? likes;
  final List<String>? tags;
  final String? text;
  final DateTime? publishDate;
  final UserModel? owner;

  PostModel({
    this.id,
    this.image,
    this.likes,
    this.tags,
    this.text,
    this.publishDate,
    this.owner,
  });

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      image: image,
      likes: likes,
      tags: tags,
      text: text,
      publishDate: publishDate,
      owner: owner?.toEntity(),
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
