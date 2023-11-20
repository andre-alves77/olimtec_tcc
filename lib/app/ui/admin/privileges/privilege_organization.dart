import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/views/CardItem.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/ui/admin/privileges/addmodality/privilege_organization_addmodality.dart';

class PrivilegeOrganizationAdmin extends StatefulWidget {
  const PrivilegeOrganizationAdmin({super.key});

  static String route = "/privilegeorganization-admin";

  @override
  State<PrivilegeOrganizationAdmin> createState() =>
      _PrivilegeOrganizationAdminState();
}

//TELA COM ATRIBUIR MODALIDADES, FUNÇÃO QUE SERÁ DESCARTADA 

class _PrivilegeOrganizationAdminState
    extends State<PrivilegeOrganizationAdmin> {
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
                        context, OrganizationAddModalityAdmin.route);
                  },
                  child: OptionConfig(
                    icone: Icons.add,
                    text1: "ADICIONAR MODALIDAES",
                    text2: "(AOS SEGUNDOS ANOS)",
                  )),
              Padding(padding: EdgeInsetsDirectional.all(8)),
              CardItem(
                  "2ºDSB",
                  PrivilegeOrganizationAdmin.route,
                  Theme.of(context).colorScheme.primaryContainer,
                  "assets/images/LOGO_2DSB_EXAMPLE.png"),
              Padding(padding: EdgeInsetsDirectional.all(8)),
              CardItem(
                  "2ºEAA",
                  PrivilegeOrganizationAdmin.route,
                  Theme.of(context).colorScheme.primaryContainer,
                  "assets/images/LOGO_3EAA_EXAMPLE.png"),
              Padding(padding: EdgeInsetsDirectional.all(8)),
              CardItem(
                  "2ºEAB",
                  PrivilegeOrganizationAdmin.route,
                  Theme.of(context).colorScheme.primaryContainer,
                  "assets/images/LOGO_1EAA_EXAMPLE.png"),
            ],
          ),
        ),
      ),
    );
  }
}
