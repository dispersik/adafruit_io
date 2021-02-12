import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adafruit_io/adafruit_io_helper/adafruit_io_api.dart';

class HTTPAdafruitIOHelper implements AdafruitIOAPI {
  static const String _apiURI = 'https://io.adafruit.com/api/v2';

  Future<Map<String, dynamic>> getLastData(Map<String, String> userData) async {
    var username = userData['username'];
    var feed = userData['feed'];
    var aioKey = userData['aioKey'];
    var route = _apiURI + '/$username/feeds/$feed/data/last';

    var response = await http.get(route, headers: {'X-AIO-Key': aioKey});
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to obtain data\nResponse code: " +
          response.statusCode.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getFeedData(
      Map<String, String> userData) async {
    var username = userData['username'];
    var feed = userData['feed'];
    var aioKey = userData['aioKey'];
    var route = _apiURI + '/$username/feeds/$feed/data';

    var response = await http.get(route, headers: {'X-AIO-Key': aioKey});
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      var result = List<Map<String, dynamic>>();

      list.forEach((element) => result.add(element));
      list.clear();
      return result;
    } else {
      throw Exception("Failed to obtain data\nResponse code: " +
          response.statusCode.toString());
    }
  }
}
