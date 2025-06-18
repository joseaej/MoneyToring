import 'package:flutter/material.dart';
import 'package:moneytoring/utils/theme.dart';

class OutlineFormWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const OutlineFormWidget({
    Key? key,
    required this.label,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputTextStyle = const TextStyle(
      color: darkfont,
      fontSize: 15,
    );

    final hintTextStyle = TextStyle(
      color: darkfont,
      fontSize: 14,
    );

    final borderRadius = BorderRadius.circular(16);

    OutlineInputBorder buildBorder(Color color, double width) {
      return OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: green,
              selectionColor: green,
              selectionHandleColor: green,
            ),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            style: inputTextStyle,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                color: darkfont,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: hintText,
              hintStyle: hintTextStyle,
              filled: true,
              fillColor: backgroundLight,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 18,
              ),
              enabledBorder: buildBorder(green, 1.5),
              focusedBorder: buildBorder(darkGreen, 2),
              errorBorder: buildBorder(Colors.redAccent, 1.5),
              focusedErrorBorder: buildBorder(Colors.red, 2),
            ),
          ),
        ));
  }
}
