import 'package:json_annotation/json_annotation.dart';
import 'package:pan_code_test/core/domain/entity/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? picture;
  final String? gender;
  final String? email;
  final DateTime? dateOfBirth;
  final String? phone;
  final Location? location;
  final DateTime? registerDate;
  final DateTime? updatedDate;

  UserModel({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.phone,
    this.location,
    this.registerDate,
    this.updatedDate,
  });

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      title: title,
      firstName: firstName,
      lastName: lastName,
      picture: picture,
      gender: gender,
      email: email,
      dateOfBirth: dateOfBirth,
      phone: phone,
      location: location?.toEntity(),
      registerDate: registerDate,
      updatedDate: updatedDate,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Location {
  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? timezone;

  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.timezone,
  });

  LocationEntity toEntity() {
    return LocationEntity(
      street: street,
      city: city,
      state: state,
      country: country,
      timezone: timezone,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}