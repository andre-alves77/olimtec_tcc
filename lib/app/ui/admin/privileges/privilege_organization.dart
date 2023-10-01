import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';

class PrivilegeOrganization extends StatefulWidget {
  const PrivilegeOrganization({super.key});

  @override
  State<PrivilegeOrganization> createState() => _PrivilegeOrganizationState();
}

class _PrivilegeOrganizationState extends State<PrivilegeOrganization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ORGANIZADORES",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/privilege_organization_addmodality');
                  },
                  child: OptionConfig(
                    icone: Icons.add,
                    text1: "ADICIONAR MODALIDAES",
                    text2: "(AOS SEGUNDOS ANOS)",
                  )),
              Padding(padding: EdgeInsetsDirectional.all(8)),
              CardItem(
                  "2ºDSB",
                  "/privilege_organization_page",
                  Theme.of(context).colorScheme.primaryContainer,
                  "assets/images/LOGO_2DSB_EXAMPLE.png"),
              Padding(padding: EdgeInsetsDirectional.all(8)),
              CardItem(
                  "2ºEAA",
                  "",
                  Theme.of(context).colorScheme.primaryContainer,
                  "assets/images/LOGO_3EAA_EXAMPLE.png"),
              Padding(padding: EdgeInsetsDirectional.all(8)),
              CardItem(
                  "2ºEAB",
                  "",
                  Theme.of(context).colorScheme.primaryContainer,
                  "assets/images/LOGO_1EAA_EXAMPLE.png"),
            ],
          ),
        ),
      ),
    );
  }
}
