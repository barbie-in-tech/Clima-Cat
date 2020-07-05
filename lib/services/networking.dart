import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  double latitude;
  double longitude;

  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }
  }
}
