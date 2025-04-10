// To parse this JSON data, do
//
//     final auteur = auteurFromMap(jsonString);

import 'dart:convert';

Auteur auteurFromMap(String str) => Auteur.fromMap(json.decode(str));

String auteurToMap(Auteur data) => json.encode(data.toMap());

class Auteur {
  int? id;
  String? name;

  Auteur({
    this.id,
    this.name,
  });

  Auteur copyWith({
    int? id,
    String? name,
  }) =>
      Auteur(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Auteur.fromMap(Map<String, dynamic> json) => Auteur(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
