import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardJogador extends StatelessWidget {
  const CardJogador({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
              imageUrl: image,
              height: 100,
              width: sizeWidth / 8.8,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Icon(Icons.person, size: 30)),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_outlined,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
    );
  }
}
