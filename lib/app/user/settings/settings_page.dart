import 'dart:math';
import 'package:flutter/material.dart';
import 'package:olimtec_tcc/app/theme/theme_store.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();
    var themeStore = context.read<ThemeStore>();
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
                selected: themeStore.value == ThemeMode.dark ? true : false,
                onTap: () => themeStore.toggle(),
                leading: const Icon(
                  Icons.nights_stay_sharp,
                ),
                title: const Text(
                  'Modo Noturno',
                ),
                trailing: Switch(
                  value: ThemeMode.dark == context.read<ThemeStore>().value
                      ? true
                      : false,
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
                  function: () {}),
              const Divider(),
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
      required Function function}) {
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
        onTap: () {
          Navigator.pushNamed(context, '/aboutus_page');
        },
      ),
    );
  }
}
