import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CommonRepo {
  static Future<List<dynamic>> makeHttpRequestForList(
      {@required String url, dynamic appendUrl}) async {
    var response = appendUrl == null
        ? await http.get(url)
        : await http.get('$url${appendUrl.toString()}');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as List;
      return jsonResponse;
    } else {
      throw Exception('Exception occured while making http request.');
    }
  }

  static Future<dynamic> makeHttpRequest({
    @required String url,
    dynamic appendUrl,
  }) async {
    var response = appendUrl == null
        ? await http.get(url)
        : await http.get('$url${appendUrl.toString()}');
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Exception occured while making http request to $url');
    }
  }
}
