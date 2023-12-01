import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modality_admin_page.dart';
import 'package:olimtec_tcc/app/ui/shared/modalityItem_card.dart';


class ModalitiesAdmin extends StatelessWidget {
  const ModalitiesAdmin({super.key});

  static String route = "/modalities-admin";

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
                padding: EdgeInsets.all(5),
                child: ModalityItemCard(
                    modality: element, routes: ModalityAdmin.route)),
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
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'MODALIDADES',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
