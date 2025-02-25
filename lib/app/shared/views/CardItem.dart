import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem(this.name, this.route, this.cor, this.image,
      {this.routeArg, super.key});

  final String image;
  final String name;
  final String route;
  final Color cor;
  final String? routeArg;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return GestureDetector(
      child: Container(
        width: sizeWidth / 1.1,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cor,
        ),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: sizeWidth / 1.8,
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: image,
                height: 100,
                width: sizeWidth / 8.8,
              ),
              title: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          route,
          arguments: routeArg,
        );
      },
    );
  }
}
