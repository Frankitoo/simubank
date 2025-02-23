import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String email;
  final String password;
  final String name;
  @JsonKey(name: 'profile_picture')
  final String profilePicture;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
