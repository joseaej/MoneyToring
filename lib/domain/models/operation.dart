import 'package:flutter/material.dart';

import '../../app/utils/enums.dart';

class Operation {
  final Icon icon = Icon(Icons.home);
  final FinancialOperation operation = FinancialOperation.deposit;
  final String label="";
  final double amount = 0.0;
  DateTime date = DateTime.now();
  
  
}