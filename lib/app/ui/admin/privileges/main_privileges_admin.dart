import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/shared/Privilege_item.dart';

class MainPrivilege extends StatefulWidget {
  const MainPrivilege({super.key});

  @override
  State<MainPrivilege> createState() => _MainPrivilegeState();
}

class _MainPrivilegeState extends State<MainPrivilege> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PRIVILÉGIOS",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: sizeWidth / 1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrivilegeOption(Icons.switch_account_rounded, "REPRESENTANTES", "/privileges_team",),
              PrivilegeOption(Icons.people, "ORGANIZADORES", "",),
            ],
          ),
        ),
      ),
    );
  }
}