// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String id;
  String name;
  String teamName;
  String avatar;
  bool isOrganization;
  bool isLeader;
  bool isAdmin;

  AppUser({
    required this.id,
    required this.name,
    required this.teamName,
    required this.avatar,
    required this.isOrganization,
    required this.isLeader,
    required this.isAdmin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'teamName': teamName,
      'avatar': avatar,
      'isOrganization': isOrganization,
      'isLeader': isLeader,
      'isAdmin': isAdmin,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['name'] as String,
      teamName: map['teamName'] as String,
      avatar: map['avatar'] as String,
      isOrganization: map['isOrganization'] as bool,
      isLeader: map['isLeader'] as bool,
      isAdmin: map['isAdmin'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  Future<String> getDocId() async {
    var doc;
    var query = await FirebaseFirestore.instance
        .collection('users')
        .where("id", isEqualTo: id)
        .get();

    for (var x in query.docs) {
      doc = x.id;
    }
    return doc;
  }
}
