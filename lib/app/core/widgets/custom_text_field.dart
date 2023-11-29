import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.errorMessage,
    this.isPassword = false,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final String? errorMessage;
  bool isPassword;
  final ValueChanged<String> onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
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
            suffixIcon: !widget.isPassword
                ? null
                : IconButton(
                    icon: Icon(
                      !_obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      _toggle();
                      print(_obscureText);
                    },
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
        if (widget.errorMessage != null && widget.errorMessage!.isNotEmpty)
          Text(
            widget.errorMessage!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}
