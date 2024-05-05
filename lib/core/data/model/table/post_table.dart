import 'package:pan_code_test/core/domain/entity/post_entity.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';

class PostTable {
  final String? id;
  final String? image;
  final int? likes;
  final String? tags;
  final String? text;
  final String? publishDate;
  final String? ownerId;
  final String? ownerTitle;
  final String? ownerFirstName;
  final String? ownerLastName;
  final String? ownerPicture;

  PostTable({
    this.id,
    this.image,
    this.likes,
    this.tags,
    this.text,
    this.publishDate,
    this.ownerId,
    this.ownerTitle,
    this.ownerFirstName,
    this.ownerLastName,
    this.ownerPicture,
  });

  factory PostTable.fromMap(Map<String, dynamic> map) {
    return PostTable(
      id: map['id'],
      image: map['image'],
      likes: map['likes'],
      tags: map['tags'],
      text: map['text'],
      publishDate: map['publishDate'],
      ownerId: map['ownerId'],
      ownerTitle: map['ownerTitle'],
      ownerFirstName: map['ownerFirstName'],
      ownerLastName: map['ownerLastName'],
      ownerPicture: map['ownerPicture'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'likes': likes,
      'tags': tags,
      'text': text,
      'publishDate': publishDate,
      'ownerId': ownerId,
      'ownerTitle': ownerTitle,
      'ownerFirstName': ownerFirstName,
      'ownerLastName': ownerLastName,
      'ownerPicture': ownerPicture,
    };
  }

  factory PostTable.fromEntity(PostEntity entity) {
    return PostTable(
      id: entity.id,
      image: entity.image,
      likes: entity.likes,
      tags: entity.tags.toString().replaceAll("[", "").replaceAll("]", ""),
      text: entity.text,
      publishDate: entity.publishDate.toString(),
      ownerId: entity.owner?.id,
      ownerTitle: entity.owner?.title,
      ownerFirstName: entity.owner?.firstName,
      ownerLastName: entity.owner?.lastName,
      ownerPicture: entity.owner?.picture,
    );
  }

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      image: image,
      likes: likes,
      tags: tags?.split(','),
      text: text,
      publishDate: DateTime.tryParse(publishDate ?? ""),
      owner: UserEntity(
        id: ownerId,
        title: ownerTitle,
        firstName: ownerFirstName,
        lastName: ownerLastName,
        picture: ownerPicture,
      ),
    );
  }
}
