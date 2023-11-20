// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppTeam {
  String name;
  String image;
  List usersList;

  AppTeam({
    required this.name,
    required this.image,
    required this.usersList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'usersList': usersList,
    };
  }

  factory AppTeam.fromMap(Map<String, dynamic> map) {
    return AppTeam(
        name: map['name'] as String,
        image: map['image'] as String,
        usersList: List.from(
          (map['usersList'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory AppTeam.fromJson(String source) =>
      AppTeam.fromMap(json.decode(source) as Map<String, dynamic>);
}
