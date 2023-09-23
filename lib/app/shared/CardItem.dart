import 'dart:math';

import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem(this.name, this.route, this.cor, this.image, {super.key});

  final String image;
  final String name;
  final String route;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return AspectRatio(
      aspectRatio: 3.2,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cor,
          ),
          color: cor,
          child: FittedBox(
            alignment: Alignment.centerLeft,
            child: Container(
              width: sizeWidth,
              child: ListTile(
                leading: Image.asset(
                  image
                ),
                title: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
         onTap: () {
          Navigator.pushNamed(
            context, route,
          );
        },
      ),
    );
  }
}