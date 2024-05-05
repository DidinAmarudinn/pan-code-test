import 'package:equatable/equatable.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';

class PostEntity extends Equatable {
  final String? id;
  final String? image;
  final int? likes;
  final List<String>? tags;
  final String? text;
  final DateTime? publishDate;
  final UserEntity? owner;

  const PostEntity({
    this.id,
    this.image,
    this.likes,
    this.tags,
    this.text,
    this.publishDate,
    this.owner,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        likes,
        tags,
        text,
        publishDate,
        owner,
      ];
}