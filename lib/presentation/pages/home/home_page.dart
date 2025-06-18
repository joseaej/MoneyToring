import 'package:flutter/material.dart';
import 'package:moneytoring/app/utils/theme.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        elevation: 0,
        title: const Text(
          'Mi Finanzas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/settings");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Text("Mayores gastos"), _buildTopSpendingItem()],
        ),
      ),
    );
  }

  Widget _buildTopSpendingItem() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: ultralightGreen,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 100),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            Icons.home,
            color: font,
            size: 3.w,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Alquiler",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: darkfont,
          ),
        ),
      ],
    );
  }
}
