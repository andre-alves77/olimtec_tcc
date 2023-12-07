import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:olimtec_tcc/app/core/providers/navigatorkey.dart';

/// A provider whose value is the global scaffold messenger key passed to
/// [MaterialApp].
///
final scaffoldMessengerKeyPod = Provider((ref) {
  return GlobalKey<ScaffoldMessengerState>();
});

/// Returns the scaffold messenger associated with [scaffoldMessengerKeyPod].
///
final scaffoldMessengerPod = Provider((ref) {
  return ref.watch(scaffoldMessengerKeyPod).currentState!;
});


enum ScaffoldAlert { error, information }


class CustomSnackBar{
  final String message;
final ScaffoldAlert type;
  CustomSnackBar({required this.message, required ref, this.type = ScaffoldAlert.information,}) : super() {

Future.delayed(Duration(seconds: 10));
     final scaffoldMessenger = ref.read(scaffoldMessengerPod);
     final context = ref.read(navigtorkeyProvider).currentContext;

    scaffoldMessenger.showSnackBar(
      SnackBar(
        
        behavior: SnackBarBehavior.floating,
        content: Text(message, style: TextStyle(color:Theme.of(context!).colorScheme.onPrimaryContainer)),
        backgroundColor: type ==ScaffoldAlert.information ?Theme.of(context).colorScheme.primaryContainer:Colors.red,
        
      ),
    );
  }

  @override
  String toString() {
    return message;
  }
}




/* final scaffoldMessenger = ref.read(scaffoldMessengerPod);

scaffoldMessenger.showSnackBar(
  SnackBar(
    content: Text('Some message'),
  ),
); */

