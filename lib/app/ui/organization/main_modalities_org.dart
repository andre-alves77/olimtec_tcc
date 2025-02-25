import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/data/dummy_data.dart';
import 'package:olimtec_tcc/app/ui/admin/modalities/modality_admin_page.dart';
import 'package:olimtec_tcc/app/ui/shared/modalityItem_card.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class MainModalitiesOrganization extends StatelessWidget {
  const MainModalitiesOrganization({super.key});

  static String route = "/mainmodalities-organization";   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        automaticallyImplyLeading: false,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Theme.of(context).brightness == Brightness.light
                ? 'assets/images/LOGO_LIGHT_MODE.png'
                : 'assets/images/LOGO_DARK_MODE.png',
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
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
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          alignment: Alignment.topCenter,
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              SizedBox(
                  child: Text(
                'SUA SALA ESTÁ RESPONSÁVEL PELAS',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                  child: Text(
                'SEGUINTES MODALIDADES',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
