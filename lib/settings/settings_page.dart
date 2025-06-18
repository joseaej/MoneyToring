import 'package:flutter/material.dart';
import 'package:moneytoring/utils/theme.dart';
import 'package:moneytoring/widget/dialogs/alert_dialog.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
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
              trailing: Switch.adaptive(
                value: true,
                onChanged: (value) {},
                activeColor: green,
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
              title: 'Cerrar sesión',
              iconColor: Colors.red,
              textColor: Colors.red,
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
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: darkfont,
          ),
        ),
        const SizedBox(height: 10),
        ...children,
      ],
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    Color iconColor = darkfont,
    Color textColor = darkfont,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: TextStyle(color: textColor)),
        trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
        splashColor: green,
      ),
    );
  }

  
}
