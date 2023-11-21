import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class Team {
  String name;
  String image;
  List<String>? players;

  Team({
    required this.name,
    required this.image, List<String>? this.players,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'players': players,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      name: map['name'] as String,
      image: map['image'] as String,
      players: map['players'] != null ? List<String>.from((map['players'] as List<String>)) : null);
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source) as Map<String, dynamic>);
}
