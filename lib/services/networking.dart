import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    final Uri apiUrlUri = Uri.parse(this.url);

    http.Response response = await http.get(apiUrlUri);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}