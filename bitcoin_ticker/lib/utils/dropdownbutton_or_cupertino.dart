import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MyDropdownButtonOrCupertinoPicker extends StatefulWidget {
  final String value;
  final List<String> items;
  final void Function(String) onChanged;
  final void Function(int) onSelectedItemChanged;

  const MyDropdownButtonOrCupertinoPicker({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.onSelectedItemChanged,
  });

  @override
  State<MyDropdownButtonOrCupertinoPicker> createState() => _MyDropdownButtonOrCupertinoPickerState();
}

class _MyDropdownButtonOrCupertinoPickerState extends State<MyDropdownButtonOrCupertinoPicker> {
  String get selectedCurrency => widget.value;
  List<String> get currenciesList => widget.items;
  void Function(String) get changeCurrency => widget.onChanged;
  void Function(int) get changeCurrencyIOS => widget.onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? MyCupertinoPicker(
      changeCurrencyIOS: changeCurrencyIOS,
      currenciesList: currenciesList
    ) : MyAndroidDropdown(
      selectedCurrency: selectedCurrency,
      currenciesList: currenciesList,
      changeCurrency: changeCurrency
    );
  }
}

class MyAndroidDropdown extends StatelessWidget {
  final String selectedCurrency;
  final List<String> currenciesList;
  final void Function(String p1) changeCurrency;

  const MyAndroidDropdown({
    super.key,
    required this.selectedCurrency,
    required this.currenciesList,
    required this.changeCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: [
        for (String c in currenciesList)
          DropdownMenuItem(
            value: c,
            child: Text(c),
          ),
      ],
      onChanged: (value) => changeCurrency(value!),
    );
  }
}

class MyCupertinoPicker extends StatelessWidget {
  const MyCupertinoPicker({
    super.key,
    required this.changeCurrencyIOS,
    required this.currenciesList,
  });

  final void Function(int p1) changeCurrencyIOS;
  final List<String> currenciesList;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: changeCurrencyIOS,
      children: [
        for (String c in currenciesList)
          Text(c),
      ],
    );
  }
}

