import 'package:flutter/cupertino.dart';

import 'package:adafruit_io/adafruit_io_helper/adafruit_io_api.dart';
import 'package:adafruit_io/adafruit_io_helper/http_adafruit_io.dart';

class AdafruitIOHelper implements AdafruitIOAPI {
  AdafruitIOHelper({@required this.username, this.aioKey}) {
    // Enable HTTP protocol by default
    _apiProtocol = httpProtocol;
  }

  final String username;
  final String aioKey;
  String _apiProtocol;

  static const String httpProtocol = 'http';
  static const String mqttProtocol = 'mqtt';

  set apiProtocol(String value) {
    if (value==httpProtocol) _apiProtocol = httpProtocol;
    else throw UnimplementedError("AdafruitIOHelper isn't implemented for that protocol");
  }

  void sendData(dynamic value) {
    if (_apiProtocol==httpProtocol) {
      final helper = HTTPAdafruitIOHelper();
      helper.sendData(value);
    } else {
      throw UnimplementedError("sendData isn't implemented for that protocol");
    }
  }
  String getData(dynamic value) {
    if (_apiProtocol==httpProtocol) {
      final helper = HTTPAdafruitIOHelper();
      return helper.getData(value);
    } else {
      throw UnimplementedError("getData isn't implemented for that protocol");
    }
  }
}

