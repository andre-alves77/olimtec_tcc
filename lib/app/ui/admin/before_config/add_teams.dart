import 'package:flutter/material.dart';

class AddTeamsAdmin extends StatelessWidget {
  const AddTeamsAdmin({super.key});

  Widget _addTeams(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '$text',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 22,
          ),
        ),
      ],
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADICIONAR TIMES",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: _addTeams('2ºEAB'),
          )
        ],
      ),
    );
  }
}