import 'package:flutter/material.dart';
import 'package:moneytoring/utils/theme.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      title: Row(
        children: const [
          Icon(Icons.logout, color: Colors.red),
          SizedBox(width: 10),
          Text(
            '¿Cerrar sesión?',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
      content: const Text(
        '¿Estás seguro de que deseas cerrar sesión de tu cuenta?',
        style: TextStyle(color: Colors.black87, fontSize: 15),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.darkfont,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Cerrar sesión'),
        ),
      ],
    ),
  );
}
