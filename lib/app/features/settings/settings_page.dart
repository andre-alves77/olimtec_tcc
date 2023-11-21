import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/auth/models/user.model.dart';
import 'package:olimtec_tcc/app/features/auth/service/auth.service.dart';

import 'package:olimtec_tcc/app/features/theme/theme_store.dart';
import 'package:olimtec_tcc/app/ui/organization/main_organization.dart';
import 'package:olimtec_tcc/app/ui/team/main_team.dart';
import 'package:olimtec_tcc/app/utils/app_routes.dart';

class SettingsPage extends ConsumerWidget {
   SettingsPage({super.key});

  static String route = "/settings-user";
List<Widget> _userrole(AppUser? user, BuildContext context){
List<Widget> _list= [];
if(user != null){

if(user.isOrganization){
_list.add(const Divider());
_list.add(              _listTile(
                  context: context,
                  title: 'Organização',
                  icon: Icons.people_alt,
                  function: () {
                    Navigator.pushNamed(context, MainOrgnization.route);
                  }),);
}
if(user.isLeader){
_list.add(const Divider());
_list.add(              _listTile(
                  context: context,
                  title: 'Representante',
                  icon: Icons.people_alt,
                  function: () {
                    Navigator.pushNamed(context, MainTeam.route);
                  }),);
}
}
return _list;
}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    final themeStore = ref.read(themeProvider.notifier);
    final auth = ref.read(authRepositoryProvider);
    final appuser = ref.watch(appUserProvider);

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
                  Navigator.pushNamed(context, '/perfil_page');
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
              ..._userrole(appuser, context),
              const Divider(),
              _listTile(
                  context: context,
                  title: 'Sobre nós',
                  icon: Icons.people_alt,
                  function: () {
                    Navigator.pushNamed(context, AppRoute.ABOUTUS_USER);
                  }),
              const Divider(),
              _listTile(
                  context: context,
                  title: "Sair",
                  icon: Icons.exit_to_app,
                  function: () {
                    //signout
                    print("signoutt");
                    auth.signOut();
                  })
            ],
          ),
        ),
      ),
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
