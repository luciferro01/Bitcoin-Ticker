import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  double currency;
  String selectedCurrency;
  String crypto;

  ResuableCard({
    required this.currency,
    required this.selectedCurrency,
    required this.crypto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.red,
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$crypto ==  $selectedCurrency => ${currency.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
