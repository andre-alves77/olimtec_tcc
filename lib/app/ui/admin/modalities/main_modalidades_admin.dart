import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/shared/modalityItem_card.dart';

class MainModalitiesAdmin extends StatelessWidget {
  const MainModalitiesAdmin({super.key});

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
      modalitiesList_dummy.forEach((element) {
        if (element.category == category) {
          widgets.add(
            Padding(
                padding: EdgeInsets.all(5), child: GestureDetector(
                  child: ModalityItemCard(element)
                )),
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
            "MODALIDADES",
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
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          alignment: Alignment.topCenter,
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [..._categoryFODASE()],
          ),
        ),
      ),
    );
  }
}