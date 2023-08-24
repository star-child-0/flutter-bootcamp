import 'package:flutter/material.dart';

class HelpCard extends StatelessWidget {
  const HelpCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            "Select a currency to see the price of the selected crypto currency.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CryptoCard extends StatefulWidget {
  final String selectedCurrency;
  final Map selectedCrypto;

  const CryptoCard({
    super.key,
    required this.selectedCurrency,
    required this.selectedCrypto,
  });

  @override
  State<CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  String get selectedCurrency => widget.selectedCurrency;
  Map get selectedCrypto => widget.selectedCrypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            "1 ${selectedCrypto['name']} = ${selectedCrypto['rate'].toStringAsFixed(2)} $selectedCurrency",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
