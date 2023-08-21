// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/models/modality/modality_category.dart';

class Modality {
  final String name;
  final IconData icon;
  final ModalityCategory category;
  String? score_type;
  Modality({
    required this.category,
    required this.name,
    required this.icon,
    this.score_type,
  });
}
