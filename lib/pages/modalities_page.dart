import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:olimtec_tcc/components/sport_item.dart';
import 'package:olimtec_tcc/components/test_widget.dart';

class ModalitiesPage extends StatelessWidget {
  const ModalitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(
          children: [
            const SportItemTest(Icons.sports_basketball, 'BASQUETE MASCULINO'),
            const SportItemTest(Icons.sports_basketball, 'BASQUETE MASCULINO'),
            const SportItemTest(Icons.sports_basketball, 'BASQUETE MASCULINO'),
            const SportItemTest(Icons.sports_basketball, 'BASQUETE MASCULINO'),
            const SportItemTest(Icons.sports_basketball, 'BASQUETE MASCULINO'),
            SportItem(Icons.sports_basketball, 'BASQUETE MASCULINO'),
          ],
        ),
      ),
    );
  }
}
