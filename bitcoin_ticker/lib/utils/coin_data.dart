import 'package:http/http.dart';
import 'dart:convert';

import '../services/networking.dart';

class CoinData {
  final List<String> _currenciesList = [
    'AUD',
    'BRL',
    'CAD',
    'CNY',
    'EUR',
    'GBP',
    'HKD',
    'IDR',
    'ILS',
    'INR',
    'JPY',
    'MXN',
    'NOK',
    'NZD',
    'PLN',
    'RON',
    'RUB',
    'SEK',
    'SGD',
    'USD',
    'ZAR'
  ];
  final List<Map> _cryptoList = [
    {"name": 'BTC', "rate": 0.0},
    {"name": 'ETH', "rate": 0.0},
    {"name": 'LTC', "rate": 0.0},
  ];
  final String _coinAPIURL = "https://rest.coinapi.io/v1/exchangerate";
  final String _apiKey = "<apiKey>";
  bool _begin = true;

  CoinData();

  List<String> get currenciesList => _currenciesList;
  List<Map> get cryptoList => _cryptoList;
  String get coinAPIURL => _coinAPIURL;
  String get apiKey => _apiKey;
  bool get begin => _begin;

  Map getCrypto(String crypto){
    return _cryptoList.firstWhere((element) => element["name"] == crypto);
  }

  Future<void> getCoinData(String selectedCrypto, String selectedCurrency) async {
    _begin = false;
    var response = await Network("$_coinAPIURL/$selectedCrypto/$selectedCurrency").getData();

    if (response.statusCode == 200) {
      StreamedResponse streamResponse = response as StreamedResponse;
      var str = await streamResponse.stream.bytesToString();
      getCrypto(selectedCrypto)["rate"] = jsonDecode(str)["rate"];
    } else {
      getCrypto(selectedCrypto)["rate"] = 0.0;
    }
  }
}
