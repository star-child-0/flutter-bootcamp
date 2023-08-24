import 'package:flutter/material.dart';

import 'utils/coin_data.dart';
import 'utils/dropdownbutton_or_cupertino.dart';
import 'utils/cryptocard.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String selectedCurrency = "";

  Future<void> changeCurrencyAndroid(String value) async {
    setState(() {
      selectedCurrency = value;
      for (Map c in coinData.cryptoList){
        coinData.getCoinData(c['name'], selectedCurrency);
      }
    });
  }

  void changeCurrencyIOS(int selectedIndex) {
    setState(() {
      selectedCurrency = coinData.currenciesList[selectedIndex];
      for (Map c in coinData.cryptoList){
        coinData.getCoinData(c['name'], selectedCurrency);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    selectedCurrency == "" ? selectedCurrency = coinData.currenciesList.first : selectedCurrency = selectedCurrency;

    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          coinData.begin ? const Expanded(
            child: Center(
              child: HelpCard(),
            ),
          ) : Column(
            children: [
              for (Map c in coinData.cryptoList)
                CryptoCard(
                  selectedCrypto: c,
                  selectedCurrency: selectedCurrency,
                ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: MyDropdownButtonOrCupertinoPicker(
              value: selectedCurrency == ""
              ? selectedCurrency
              : coinData.currenciesList.first,
              items: coinData.currenciesList,
              onSelectedItemChanged: (value) => changeCurrencyIOS(value),
              onChanged: (value) => changeCurrencyAndroid(value),
            ),
          ),
        ],
      ),
    );
  }
}
