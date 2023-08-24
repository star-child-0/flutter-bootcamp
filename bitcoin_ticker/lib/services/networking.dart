import 'package:http/http.dart' as http;

import '../utils/coin_data.dart';

class Network{
  final String url;

  Network(this.url);

  Future getData() async {
    CoinData coinData = CoinData();
    Uri uri = Uri.parse(url);
    http.Request request = http.Request('GET', uri);
    request.headers.clear();
    request.headers.addAll({
      "X-CoinAPI-Key": coinData.apiKey,
    });

    var response = await request.send();
    return response;
  }
}
