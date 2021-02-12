import 'package:flutter/cupertino.dart';

import 'package:adafruit_io/adafruit_io_helper/adafruit_io_api.dart';
import 'package:adafruit_io/adafruit_io_helper/http_adafruit_io.dart';

class AdafruitIOHelper {
  AdafruitIOHelper({@required this.username, this.feed, this.aioKey}) {
    // Enable HTTP protocol by default
    _apiProtocol = httpProtocol;
  }

  final String username;
  final String aioKey;
  String feed;
  String _apiProtocol;
  
  Map<String, String> get _userData => {
    'username': username,
    'aioKey': aioKey,
    'feed': feed
  };

  static const String httpProtocol = 'http';
  static const String mqttProtocol = 'mqtt';

  set apiProtocol(String value) {
    if (value==httpProtocol) _apiProtocol = httpProtocol;
    else throw UnimplementedError("AdafruitIOHelper isn't implemented for that protocol");
  }

  Future<Map<String, dynamic>> getLastData() {
    if (_apiProtocol==httpProtocol) {
      final helper = HTTPAdafruitIOHelper();
      return helper.getLastData(_userData);
    } else {
      throw UnimplementedError("getLastData isn't implemented for that protocol");
    }
  }

  Future<Map<String, dynamic>> getFeedData() {
    if (_apiProtocol==httpProtocol) {
      final helper = HTTPAdafruitIOHelper();
      return helper.getFeedData(_userData);
    } else {
      throw UnimplementedError("This method isn't implemented for that protocol");
    }
  }
}

