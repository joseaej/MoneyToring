import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:moneytoring/services/auth_service.dart';

import '../utils/theme.dart';
import '../widget/outline_form_widget.dart';
import '../widget/password_outline_form_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sizer(
        builder: (context, orientation, deviceType) {
          return Center(
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
                    ),
                    OutlineFormWidget(
                      label: "Usuario",
                      hintText: "Usuario",
                      prefixIcon: Icon(Icons.person),
                      controller: _userController,
                    ),
                    PasswordOutlineFormWidget(
                      label: "Contraseña",
                      hintText: "Contraseña",
                      controller: _passwordController,
                    ),
                    PasswordOutlineFormWidget(
                      label: "Confirmar Contraseña",
                      hintText: "Confirmar Contraseña",
                      controller: _confirmController,
                    ),
                    SizedBox(height: 3.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          User? user = await AuthService.createUserWithPassword(
                            _emailController.text,
                            _passwordController.text,
                          );
                          if (user != null) {
                            Navigator.pushReplacementNamed(context, "/onboarding");
                          }
                        },
                        child: Text(
                          'Registrarse',
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    _rowlinea,
                    _rowiconlogin,
                    _createaccount,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding get _rowlinea => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.darkfont,
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
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
            "Accede con tu cuenta aquí:",
            style: TextStyle(color: AppColors.darkfont, fontSize: 16.sp),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text(
              "Acceder",
              style: TextStyle(color: AppColors.green, fontSize: 16.sp),
            ),
          ),
        ],
      );
}
