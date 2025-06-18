import 'package:flutter/material.dart';
import 'package:moneytoring/app/utils/theme.dart';
import 'package:moneytoring/domain/providers/settings_provider.dart';
import 'package:provider/provider.dart';

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
  late final SettingsProvider _settingsProvider;
  void _toggleObscureText() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    _settingsProvider = Provider.of<SettingsProvider>(context);
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
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: const TextStyle(
              color: darkfont,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintText: widget.hintText,
            filled: true,
            fillColor: _settingsProvider.settings.isDarkTheme?backgroundDark:backgroundLight,
            prefixIcon: const Icon(Icons.lock_outline, color: darkfont),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: darkfont,
              ),
              onPressed: _toggleObscureText,
            ),
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
      ),
    );
  }
}
