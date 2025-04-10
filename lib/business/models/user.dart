// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  DateTime? updatedAt;
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.updatedAt,
    this.token,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? emailVerifiedAt,
    DateTime? updatedAt,
    String? token,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        token: token ?? this.token,
      );

  factory User.fromMap(Map json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "token": token,
  };
}
