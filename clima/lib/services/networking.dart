import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  final String url;

  Network(this.url);

  Future getData() async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return({"error": response.statusCode});
    }
  }
}
