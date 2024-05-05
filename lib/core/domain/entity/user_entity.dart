import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? picture;
  final String? gender;
  final String? email;
  final DateTime? dateOfBirth;
  final String? phone;
  final LocationEntity? location;
  final DateTime? registerDate;
  final DateTime? updatedDate;

  const UserEntity({
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

  @override
  List<Object?> get props => [
        id,
        title,
        firstName,
        lastName,
        picture,
        gender,
        email,
        dateOfBirth,
        phone,
        location,
        registerDate,
        updatedDate,
      ];

  String getfullName() {
    return "$firstName $lastName";
  }
}

class LocationEntity extends Equatable {
  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? timezone;

  const LocationEntity({
    this.street,
    this.city,
    this.state,
    this.country,
    this.timezone,
  });

  @override
  List<Object?> get props => [
        street,
        city,
        state,
        country,
        timezone,
      ];

  String getFullLocation() {
    return "$street, $city, $state, $country Timezone: $timezone";
  }
}
