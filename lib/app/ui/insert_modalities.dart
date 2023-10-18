import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';
import 'package:olimtec_tcc/app/ui/modlityitemadmin.dart';
import 'package:olimtec_tcc/app/ui/shared/modalityItem_card.dart';
import 'package:olimtec_tcc/app/shared/views/option_config.dart';

class InsertModalitiesAdmin extends StatelessWidget {
  const InsertModalitiesAdmin({super.key});

  static String route = "/insertmodalities-admin";

  List<Widget> _categoryFODASE() {
    List<Widget> widgets = [];
    modalityCategoryList_dummy.forEach((category) {
      widgets.add(
        Padding(
          padding: EdgeInsets.all(5),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              category.name.toUpperCase(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
      modalitiesList_dummy.forEach((modality) {
        if (modality.category == category) {
          widgets.add(
            Padding(
              padding: EdgeInsets.all(5),
              child: GestureDetector(
                child: ModalityItemCardAdmin(func: () {}, modality: modality),
              ),
            ),
          );
        }
      });
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            "INSERIR MODALIDADES",
            style: TextStyle(
              fontFamily: 'Lato',
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                child: OptionConfig(
                    icone: Icons.add, text1: "ADICIONAR MODALIDADES"),
              ),
              SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  children: [
                    ..._categoryFODASE(),
                    ..._categoryFODASE(),
                    ..._categoryFODASE(),
                    ..._categoryFODASE(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//InsertModalities