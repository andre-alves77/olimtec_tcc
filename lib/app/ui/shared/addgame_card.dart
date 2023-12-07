
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/widgets/scaffold_mensager.view.dart';
import 'package:olimtec_tcc/app/features/championship/service/locals.service.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';


// ignore: must_be_immutable
class AddGamecardStream extends ConsumerWidget {
  const AddGamecardStream({super.key, required String this.docId});

  final String docId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locals = ref.watch(localsProvider).value;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('game')
            .doc(docId)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text('Erro ao carregar os dados do jogo');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Carregando");
          }
          if (snapshot.data == null) {
            return SizedBox(
              height: 0,
              width: 0,
            );
          }

          // Atualize o widget com os novos dados do jogo aqui
          print(snapshot.requireData.data());
          final game = snapshot.data!.data() as Map<String, dynamic>;

          return AddGameCard(game, docId, locals);
        }

        // etc.
        //   return NewGameCard(game);
        );
  }
}


class AddGameCard extends ConsumerStatefulWidget {
  AddGameCard(this.game, this.docId, this.locals, {super.key});
  final Map<String, String>? locals;
  final Map<String, dynamic> game;
  final String docId;

 @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGameCardState();
}

class _AddGameCardState extends ConsumerState<AddGameCard> {

   TimeOfDay _selectedTime= TimeOfDay.now();
   DateTime _selectedDay = DateTime.now();

 Future<void> selectTime(BuildContext context) async {
   final TimeOfDay? picked = await showTimePicker(
     context: context,
     initialTime: TimeOfDay.now(),
     builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );}
   );

   if (picked != null && picked != _selectedTime) {
    try{
      
await FirebaseFirestore.instance.collection('game').doc(widget.docId).update({'time':"${picked.hour}h${picked.minute}"});
     setState(() {
       _selectedTime = picked;
     });
    }catch(e){

    }
   }
 }

  Future<void> selectDay(BuildContext context) async {
   final _picked = await showDatePicker(
    firstDate: DateTime(2022),
    lastDate: DateTime(2060),
    initialDate: DateTime.now(),
     context: context,
     builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );}
   );

   if (_picked != null && _picked != _selectedTime) {
    try{
await FirebaseFirestore.instance.collection('game').doc(widget.docId).update({'date':"${_picked.day}/${_picked.month}"});
     setState(() {
       _selectedDay = _picked;
     });
    }catch(e){

    }
   }
 }



  @override
  Widget build(BuildContext context) {
    String? dropdownvalue = widget.game['local'];
    List<String> items = [];
    widget.locals!.forEach((key, value) {
      items.add(value);
    });
    final sizeWidth = min(MediaQuery.of(context).size.width, 400).toDouble();

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Theme.of(context).colorScheme.primaryContainer,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: sizeWidth / 1.2,
        height: 280,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.game['modalidade'],
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: sizeWidth / 1.5,
                child: Divider(
                  height: 5,
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child:  CachedNetworkImage(
// imageUrl:                        "https://img.freepik.com/premium-vector/esports-tiger-face-mascot-logo_123378-6.jpg?w=740",
//                         width: sizeWidth / 6,
//                         fit: BoxFit.cover,
//                       ),
//                     ),

                    Row(
                      children: [
                        Icon(
                          Icons.circle_sharp,
                          color: Colors.orange,
                          size: 20,
                        ),
                        Text(
                          "A ser confirmado",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),

//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: CachedNetworkImage(
// imageUrl:                        "https://img.freepik.com/premium-vector/esports-tiger-face-mascot-logo_123378-6.jpg?w=740",
//                         width: sizeWidth / 6,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.game['team1'] ?? 'TIME 1',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: sizeWidth / 4.8,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "X",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.game['team2'] ?? 'TIME 2',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: sizeWidth / 1.5,
                child: Divider(
                  height: 5,
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 10, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SELECIONAR O HORÁRIO:",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: 
                        () {

                         selectTime(context);
                        },
                      child: FittedBox(
                        child: Container(
                          width: sizeWidth / 4.8,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.game['time']?? "  ",
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                width: sizeWidth / 1.5,
                child: Divider(
                  height: 5,
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SELECIONAR O DIA:",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: 
                        () {
                         selectDay(context);
                        },
                      child: FittedBox(
                        child: Container(
                          width: sizeWidth / 4.8,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.game['date']?? "  ",
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SELECIONAR O LOCAL: ",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: sizeWidth / 2.8,
                      child: DropdownButton(
                          dropdownColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          hint: Text("Seleciona a sala"),
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontFamily: 'Lato',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          value: dropdownvalue,
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) async {
                            try {
                              await FirebaseFirestore.instance
                                  .collection('game')
                                  .doc(widget.docId)
                                  .update({'local': value});
                              setState(() {
                                dropdownvalue = value!;
                              });
                            } catch (e) {}
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: InkWell(
                  onTap: () async{
                    if(widget.game['date'] == 'indefinida'|| widget.game['time'] == null || widget.game['local'] == null){
CustomSnackBar(message: "Preencha todos os campos", ref: ref, type: ScaffoldAlert.error);
                    }else{
try{
  await FirebaseFirestore.instance.collection('game').doc(widget.docId).update({'gameState': "predicted"});
}catch (e){
  CustomSnackBar(message: "Um erro aconteceu tente novamente", ref: ref,type: ScaffoldAlert.error);
}
                    }
                  },
                  child: Container(
                    width: sizeWidth / 1.8,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CONFIRMAR",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
