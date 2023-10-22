import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/app.dart';
import 'package:olimtec_tcc/app/features/auth/lading.store.dart';
import 'package:olimtec_tcc/app/features/settings/about_us_page.dart';
import 'package:olimtec_tcc/app/features/settings/perfil_page.dart';

import 'package:olimtec_tcc/app/features/theme/theme_store.dart';
import 'package:olimtec_tcc/app/ui/admin/main_admin.dart';
import 'package:olimtec_tcc/app/ui/organization/main_organization.dart';
import 'package:olimtec_tcc/app/ui/team/main_team.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static String route = "/settings-user";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final themeStore = ref.read(themeProvider.notifier);

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
        title: const Text(
          'CONFIGURAÇÕES',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          constraints: const BoxConstraints(maxWidth: 400),
          width: sizeWidth,
          child: Column(
            children: [
              GestureDetector(
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  leading: Container(
                    width: sizeWidth / 5,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: Icon(Icons.person, size: 30),
                      ),
                    ),
                  ),
                  title: Text(
                    'André',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  subtitle: Text('Visualizar perfil',
                      style: TextStyle(color: Colors.grey)),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,
                      size: 30,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                onTap: () {
                  Navigator.pushNamed(context, PerfilUser.route);
                },
              ),
              const Divider(),
              ListTile(
                selected: themeStore.state == ThemeMode.dark ? true : false,
                onTap: () => themeStore.toggle(),
                leading: const Icon(
                  Icons.nights_stay_sharp,
                ),
                title: const Text(
                  'Modo Noturno',
                ),
                trailing: Switch(
                  value: ThemeMode.dark == themeStore.state ? true : false,
                  onChanged: (value) {
                    themeStore.toggle();
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
                iconColor: Theme.of(context).colorScheme.onPrimaryContainer,
                textColor: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              const Divider(),
              _listTile(
                  context: context,
                  title: 'Sobre nós',
                  icon: Icons.people_alt,
                  function: () {
                    Navigator.pushNamed(context, AboutUsPage.route);
                  }),
              const Divider(),
              _listTile(
                  context: context,
                  title: "Sair",
                  icon: Icons.exit_to_app,
                  function: () {
                    //signout
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "btn01",
            child: Icon(Icons.star_border),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MainTeam.route, (route) => false);
            },
          ),
          FloatingActionButton(
            heroTag: "btn02",
            child: Icon(Icons.star_half),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MainOrgnization.route, (route) => false);
            },
          ),
          FloatingActionButton(
            heroTag: "btn03",
            child: Icon(Icons.star),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MainAdmin.route, (route) => false);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  InkWell _listTile(
      {required BuildContext context,
      required String title,
      required IconData icon,
      required Function() function}) {
    return InkWell(
      onTap: () => function,
      child: GestureDetector(
        child: ListTile(
          leading: Icon(
            icon,
          ),
          title: Text(
            title,
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          iconColor: Theme.of(context).colorScheme.onPrimaryContainer,
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,
          hoverColor: Theme.of(context).colorScheme.primary,
        ),
        onTap: function,
      ),
    );
  }
}
