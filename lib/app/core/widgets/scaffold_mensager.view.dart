import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class CustomSnackBar extends SnackBar {
  const CustomSnackBar({super.key, required super.content, required this.type});

  final ScaffoldAlert type;

  Widget build(BuildContext context, WidgetRef ref) {
    return SnackBar(
      content: const Text("Some Content"),
      backgroundColor: type == ScaffoldAlert.error ? Colors.red : null,
    );
  }
}







/* final scaffoldMessenger = ref.read(scaffoldMessengerPod);

scaffoldMessenger.showSnackBar(
  SnackBar(
    content: Text('Some message'),
  ),
); */

