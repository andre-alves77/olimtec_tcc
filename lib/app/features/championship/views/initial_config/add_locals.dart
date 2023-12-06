import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/features/championship/initial_config.store.dart';
import 'package:olimtec_tcc/app/features/championship/views/initial_config/add_modality_component.dart';

class AddLocalsAdmin extends ConsumerWidget {
  const AddLocalsAdmin({super.key});

  static String route = "/AddLocals_admin";

  Widget _addLocals(BuildContext context, String text, WidgetRef ref) {
    return 
    FittedBox(
      child: 
    Stack(
      alignment: Alignment.topRight,
      children: [
         Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '$text',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
      
        IconButton(
            onPressed: () {
              try {
                ref.read(initialConfigProvider).removeLocal(text);
              } catch (error) {
                print(error);
              }
            },
            icon: Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
              size: 40.5,
            )),
      ],
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final localList = ref.watch(initialConfigProvider).localList;
    List<Widget> localWidgets = [];
    localList.forEach((element) {
      localWidgets.add(_addLocals(context, element, ref));
    });
    String localName = "";
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: const Text(
            "ADICIONAR LOCAIS",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
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
                              onChanged: (value) => localName = value,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nome do local: Ex: quadra',
                                labelStyle: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                hintText: 'quadra',
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
                                      .addLocal(localName);
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
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: localWidgets,
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
                                Navigator.pop(context);
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
      ),
    );
  }
}
