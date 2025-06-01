import 'package:flutter/material.dart';
import 'package:moneytoring/utils/theme.dart';

class PasswordOutlineFormWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PasswordOutlineFormWidget({
    Key? key,
    required this.label,
    required this.hintText,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordOutlineFormWidget> createState() => _PasswordOutlineFormWidgetState();
}

class _PasswordOutlineFormWidgetState extends State<PasswordOutlineFormWidget> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    final inputTextStyle = const TextStyle(
      color: AppColors.darkfont,
      fontSize: 15,
    );

    final hintTextStyle = TextStyle(
      color: AppColors.darkfont,
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
            cursorColor: AppColors.green,
            selectionColor: AppColors.green,
            selectionHandleColor: AppColors.green,
          ),
        ),
        child: TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator,
          style: inputTextStyle,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: const TextStyle(
              color: AppColors.darkfont,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintText: widget.hintText,
            hintStyle: hintTextStyle,
            filled: true,
            fillColor: AppColors.backgroundLight,
            prefixIcon: const Icon(Icons.lock_outline, color: AppColors.darkfont),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.darkfont,
              ),
              onPressed: _toggleObscureText,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 18,
            ),
            enabledBorder: buildBorder(AppColors.green, 1.5),
            focusedBorder: buildBorder(AppColors.darkGreen, 2),
            errorBorder: buildBorder(Colors.redAccent, 1.5),
            focusedErrorBorder: buildBorder(Colors.red, 2),
          ),
        ),
      ),
    );
  }
}
