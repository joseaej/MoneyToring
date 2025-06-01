import 'package:flutter/material.dart';
import 'package:moneytoring/utils/theme.dart';
import 'package:moneytoring/widget/outline_form_widget.dart';
import 'package:moneytoring/widget/password_outline_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15,0,15,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlineFormWidget(label: "Email", hintText: "Email",prefixIcon: Icon(Icons.email),),
            OutlineFormWidget(label: "Usuario", hintText: "Usuario",prefixIcon: Icon(Icons.person),),
            PasswordOutlineFormWidget(label: "Contraseña", hintText: "Contraseña"),
            PasswordOutlineFormWidget(label: "Confirmar Contraseña", hintText: "Confirmar Contraseña"),
            _rowlinea,
            _rowiconlogin,
            _createaccount
          ],
        ),
      ),
    );
  }
    Padding get _rowlinea => Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.darkfont,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "o",
                style: TextStyle(color: AppColors.darkfont),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppColors.darkfont,
                thickness: 1,
              ),
            ),
          ],
        ),
      );
  Row get _rowiconlogin => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.apple)
            ),
          ),
        ],
      );

  Row get _createaccount => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Crea tu cuenta aqui:",
            style: TextStyle(color: AppColors.darkfont),
          ),
          TextButton(
            onPressed: () {
              
            },
            child: Text(
              "Registrar",
              style: TextStyle(color: AppColors.green),
            ),
          ),
        ],
      );
}