import 'package:flutter/material.dart';

class RegulationPageAdmin extends StatelessWidget {
  const RegulationPageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VISUALIZAR REGULAMENTO",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('REGULAMENTO ATUAL',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
