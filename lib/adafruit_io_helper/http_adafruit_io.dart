import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adafruit_io/adafruit_io_helper/adafruit_io_api.dart';

class HTTPAdafruitIOHelper implements AdafruitIOAPI {
  // dummy func's
  void sendData(value) => print("http send $value");
  String getData(value) {print('http get $value'); return 'http get value';}

  Future<Map<String, dynamic>> getLastData(Map<String, String> userData) async {
    var username = userData['user'];
    var feedKey = userData['feedKey'];
    var aioKey = userData['aioKey'];

    var url = 'https://io.adafruit.com/api/v2/$username/feeds/$feedKey/data/last';
    var response = await http.get(url, headers: {'X-AIO-Key': aioKey});
    return jsonDecode(response.body);
  }
}   