import 'dart:math';

import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard(this.modalidade, this.local, this.imageA, this.imageB, this.timeA, this.timeB, {super.key});

  final modalidade;
  final local;
  final imageA;
  final imageB;
  final timeA;
  final timeB;

  @override
  Widget build(BuildContext context) {

   var size = MediaQuery.of(context).size;
   final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Container(
      constraints: BoxConstraints(
        minWidth: 200,
        maxWidth: 400,
      ),
      width: size.width * 0.9,
      height: size.height * 0.30,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  modalidade,
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  local,
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageA,
                      width: sizeWidth / 4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/IMAGE_VS_L.png'
                      : 'assets/images/IMAGE_VS.png',
                      width: sizeWidth / 4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageB,
                      width: sizeWidth / 4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    timeA,
                    style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: sizeWidth / 14,),
                  Text(
                    timeB,
                    style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}