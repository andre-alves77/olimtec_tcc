import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/shared/addgame_card.dart';

class AddGameOrganization extends StatefulWidget {
  const AddGameOrganization({super.key});

  static String route = "/addgame-organization";

  @override
  State<AddGameOrganization> createState() => _AddGameOrganizationState();
}

class _AddGameOrganizationState extends State<AddGameOrganization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADICIONAR JOGO",
          style: TextStyle(
              fontFamily: 'Lato', fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "CONFIRMAR JOGOS",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0)),
                        AddGameCard(gametest),
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0)),
                        AddGameCard(gametest),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
