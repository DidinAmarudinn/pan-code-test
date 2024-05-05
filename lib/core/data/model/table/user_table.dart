import 'package:pan_code_test/core/domain/entity/user_entity.dart';

class UserTable {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? picture;
  final String? gender;
  final String? email;
  final String? dateOfBirth; 
  final String? phone;
  final String? locationStreet;
  final String? locationCity;
  final String? locationState;
  final String? locationCountry;
  final String? locationTimezone;
  final String? registerDate;
  final String? updatedDate; 

  UserTable({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.phone,
    this.locationStreet,
    this.locationCity,
    this.locationState,
    this.locationCountry,
    this.locationTimezone,
    this.registerDate,
    this.updatedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
      'gender': gender,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'phone': phone,
      'locationStreet': locationStreet,
      'locationCity': locationCity,
      'locationState': locationState,
      'locationCountry': locationCountry,
      'locationTimezone': locationTimezone,
      'registerDate': registerDate,
      'updatedDate': updatedDate,
    };
  }

  factory UserTable.fromEntity(UserEntity entity) {
    return UserTable(
      id: entity.id,
      title: entity.title,
      firstName: entity.firstName,
      lastName: entity.lastName,
      picture: entity.picture,
      gender: entity.gender,
      email: entity.email,
      dateOfBirth: entity.dateOfBirth.toString(),
      phone: entity.phone,
      locationStreet: entity.location?.street,
      locationCity: entity.location?.city,
      locationState: entity.location?.state,
      locationCountry: entity.location?.country,
      locationTimezone: entity.location?.timezone,
      registerDate: entity.registerDate.toString(),
      updatedDate: entity.updatedDate.toString(),
    );
  }
  factory UserTable.fromMap(Map<String, dynamic> map) {
    return UserTable(
      id: map['id'],
      title: map['title'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      picture: map['picture'],
      gender: map['gender'],
      email: map['email'],
      dateOfBirth: map['dateOfBirth'],
      phone: map['phone'],
      locationStreet: map['locationStreet'],
      locationCity: map['locationCity'],
      locationState: map['locationState'],
      locationCountry: map['locationCountry'],
      locationTimezone: map['locationTimezone'],
      registerDate: map['registerDate'],
      updatedDate: map['updatedDate'],
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      title: title,
      firstName: firstName,
      lastName: lastName,
      picture: picture,
      gender: gender,
      email: email,
      dateOfBirth: DateTime.tryParse(dateOfBirth ?? ""),
      phone: phone,
      location: LocationEntity(
        street: locationStreet,
        city: locationCity,
        state: locationState,
        country: locationCountry,
        timezone: locationTimezone,
      ),
      registerDate: DateTime.tryParse(registerDate ?? ""),
      updatedDate: DateTime.tryParse(updatedDate ?? ""),
    );
  }
}
