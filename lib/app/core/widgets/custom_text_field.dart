import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      required this.hintText,
      this.errorMessage,
      this.isPassword = false,
      required this.onChanged})
      : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final String? errorMessage;
  final bool isPassword;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: isPassword,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            labelStyle: const TextStyle(
              fontFamily: 'Lato',
              color: Color(0xFF414141),
              fontSize: 18,
            ),
            hintStyle: const TextStyle(
              fontFamily: 'Lato',
              color: Color(0xFF414141),
              fontSize: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
          ),
          style: TextStyle(
            fontFamily: "Lato",
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        const SizedBox(height: 8),
        if (errorMessage != null && errorMessage!.isNotEmpty)
          Text(
            errorMessage!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}
