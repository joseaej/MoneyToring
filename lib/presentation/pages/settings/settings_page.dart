import 'package:flutter/material.dart';
import 'package:moneytoring/app/utils/theme.dart';
import 'package:moneytoring/domain/providers/settings_provider.dart';
import 'package:moneytoring/presentation/widget/dialogs/alert_dialog.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsProvider settingsProvider;
  bool isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
    isDarkTheme = settingsProvider.settings.isDarkTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        leading: IconButton(onPressed: () {
          Navigator.pushReplacementNamed(context,"/home");
        }, icon: Icon(Icons.arrow_back)),
        title: const Text(
          'Configuración',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          _buildSection('Cuenta', [
            _buildTile(
              icon: Icons.person_outline,
              title: 'Editar perfil',
              onTap: () {},
            ),
            _buildTile(
              icon: Icons.lock_outline,
              title: 'Cambiar contraseña',
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 24),
          _buildSection('Preferencias', [
            _buildTile(
              icon: Icons.dark_mode_outlined,
              title: 'Tema oscuro',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Switch.adaptive(
                    activeTrackColor: lightGreen,
                    value: settingsProvider.settings.isDarkTheme,
                    onChanged: (value) {
                      settingsProvider.togleTheme();
                    },
                    activeColor: font,
                  ),
                ],
              ),
            ),
            _buildTile(
              icon: Icons.notifications_outlined,
              title: 'Notificaciones',
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 24),
          _buildSection('Más', [
            _buildTile(
              icon: Icons.info_outline,
              title: 'Acerca de Moneytoring',
              onTap: () {},
            ),
            _buildTile(
              icon: Icons.logout,
              isRed: true,
              title: 'Cerrar sesión',
              onTap: () {
                showLogoutDialog(context);
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:  TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
         SizedBox(height: 4.h),
        ...children,
      ],
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    bool isRed = false,
    VoidCallback? onTap,
  }) {
    Color color = (isRed)?errorColor:(isDarkTheme)?font:darkfont;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: (isDarkTheme)?backgroundBlack:backgroundLight,
        border: Border.all(color: (isRed)?errorColor:lightGreen,width: 2,style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(30)
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Icon(icon,color:color ,),
        title: Text(title,style: TextStyle(color: color),),
        trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
        splashColor: green,
      ),
    );
  }
}
