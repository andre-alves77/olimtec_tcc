import 'dart:math';

import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  GameCard({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return AspectRatio(
      aspectRatio: 3,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          width: sizeWidth,
          child: Column(
            children: [
              Row(
                children: [
                  Text('BASQUETE MASCULINO'),
                  Text('-'),
                  Text('Quadra'),
                ],
              ),
              Divider(
                height: 5,
                thickness: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/LOGO_1EAA_EXAMPLE.png',
                            width: sizeWidth / 5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text('2EEE'),
                      ],
                    ),
                  ),
                  Column(
                    children: [],
                  ),
                  Column(
                    children: [],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
