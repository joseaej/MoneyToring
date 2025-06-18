import 'package:flutter/material.dart';
import 'package:moneytoring/app/utils/theme.dart';
import 'package:moneytoring/domain/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class OutlineFormWidget extends StatefulWidget {
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
  State<OutlineFormWidget> createState() => _OutlineFormWidgetState();
}

class _OutlineFormWidgetState extends State<OutlineFormWidget> {

  late final SettingsProvider _settingsProvider;
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
            obscureText: widget.obscureText,
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
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
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
