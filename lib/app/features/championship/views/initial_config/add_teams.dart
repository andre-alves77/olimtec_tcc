import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/initial_config.store.dart';
import 'package:olimtec_tcc/app/features/championship/views/initial_config/add_modality_component.dart';
import 'package:olimtec_tcc/app/models/teamList.dart';
import 'package:provider/provider.dart';

class AddTeamsAdmin extends ConsumerWidget {
  const AddTeamsAdmin({super.key});

  static String route = "/addteams_admin";

  Widget _addTeams(BuildContext context, String text, WidgetRef ref) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        FittedBox(
          child: Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                FittedBox(
                  child: Text(
                    '$text',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              ref.read(initialConfigProvider).removeTeam(text);
            },
            icon: Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
              size: 22.5,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final teamList = ref.watch(initialConfigProvider).teamList;
    List<Widget> teamWidgets = [];
    teamList.forEach((element) {
      teamWidgets.add(_addTeams(context, element.name, ref));
    });
    String teamName = "";
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: const Text(
            "ADICIONAR TIMES",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Center(
          heightFactor: 1,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: FittedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 225,
                          child: TextFormField(
                            validator: (value) {
                              String x = value ?? "";
                              if (x.length <= 2) {
                                return "Insira o nome";
                              }
                              return null;
                            },
                            onChanged: (value) => teamName = value,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Nome da sala: Ex: 2ºEAA',
                              labelStyle: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: '1ºEAA',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            autofocus: true,
                            focusColor: Theme.of(context).colorScheme.primary,
                            hoverColor: Theme.of(context).colorScheme.primary,
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? true) {
                                ref
                                    .read(initialConfigProvider)
                                    .addTeam(teamName);
                              }
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: teamWidgets,
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Container(
                          width: 170,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AddModalityAdmin.route);
                            },
                            child: Text(
                              'CONFIRMAR',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
