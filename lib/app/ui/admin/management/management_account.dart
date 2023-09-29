import 'package:flutter/material.dart';
import 'dart:math';

class ManagementAccount extends StatelessWidget {
  const ManagementAccount({super.key});
  _CardJogador() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'assets/images/LOGO_USUARIO.png',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'Fulano de tal',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
       trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove, color: Colors.red),
       )
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'CONTA - 2°DSB',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  FittedBox(
                    child: Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/LOGO_2DSB_EXAMPLE.png',
                          width: 170,
                          height: 170,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '2DSB',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 330,
                    child: Divider(
                      height: 10,
                      thickness: 2,
                    ),
                  )
                ],
              ),
              FittedBox(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'ALUNOS',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'EXCLUIR CONTAS ABAIXO',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 2,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  constraints: BoxConstraints(maxWidth: sizeWidth),
                  height: 400,
                  child: ListView(
                    children: [
                      _CardJogador(),
                      Divider(
                          height: 2,
                          thickness: 1.5,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      _CardJogador(),
                      Divider(
                          height: 2,
                          thickness: 1.5,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      _CardJogador(),
                      Divider(
                          height: 2,
                          thickness: 1.5,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
