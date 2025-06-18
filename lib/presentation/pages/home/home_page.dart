import 'package:flutter/material.dart';
import 'package:moneytoring/app/utils/theme.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _SummaryCard(),
            const SizedBox(height: 20),
            _SectionTitle('Resumen'),
            const SizedBox(height: 10),
            _FinanceCard(
              title: 'Ahorros',
              amount: '2.300€',
              icon: Icons.savings,
              color: green,
            ),
            const SizedBox(height: 10),
            _FinanceCard(
              title: 'Gastos',
              amount: '850€',
              icon: Icons.trending_down,
              color: Colors.redAccent,
            ),
            const SizedBox(height: 10),
            _FinanceCard(
              title: 'Meta: Viaje a Japón',
              amount: '1.000€ / 3.000€',
              icon: Icons.flag,
              color: darkGreen,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: green,
        icon: const Icon(Icons.add),
        label: const Text('Añadir movimiento'),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: green,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _SummaryItem(title: 'Total', value: '3.450€'),
            _SummaryItem(title: 'Ingresos', value: '2.000€'),
            _SummaryItem(title: 'Gastos', value: '850€'),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;

  const _SummaryItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: backgroundLight,
            )),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: backgroundLight)),
      ],
    );
  }
}

class _FinanceCard extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;
  final Color color;

  const _FinanceCard({
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(amount, style: TextStyle(color: color)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: darkGreen),
        ),
      ],
    );
  }
}
