import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:moneytoring/services/auth_service.dart';

import '../utils/theme.dart';
import '../widget/outline_form_widget.dart';
import '../widget/password_outline_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/moneytoring_icon_nobg.png',
                  width: 30.w,
                ),
                OutlineFormWidget(
                  label: "Email",
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debes introducir un email';
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return 'Debes introducir un email válido';
                    }
                    return null;
                  },
                ),
                PasswordOutlineFormWidget(
                  label: "Contraseña",
                  hintText: "Contraseña",
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debes introducir una contraseña';
                    } else if (value.length < 6) {
                      return 'Debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      padding: EdgeInsets.symmetric(vertical: 1.8.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      User? user = await AuthService.siginInWithPassword(
                          _emailController.text, _passwordController.text);
                      if (user != null) {
                        Navigator.pushReplacementNamed(context, "/home");
                      }
                    },
                    child: Text(
                      'Acceder',
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                _rowlinea,
                _rowiconlogin,
                _createaccount,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding get _rowlinea => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Expanded(
              child: Divider(color: darkfont, thickness: 1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Text("o", style: TextStyle(color: darkfont)),
            ),
            Expanded(
              child: Divider(color: darkfont, thickness: 1),
            ),
          ],
        ),
      );

  Row get _rowiconlogin => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.apple, size: 7.w),
          ),
        ],
      );

  Row get _createaccount => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Crea tu cuenta aqui:",
            style: TextStyle(color: darkfont, fontSize: 16.sp),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
            child: Text(
              "Registrar",
              style: TextStyle(color: green, fontSize: 16.sp),
            ),
          ),
        ],
      );
}
