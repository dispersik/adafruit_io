import 'package:adafruit_io/adafruit_io_helper/adafruit_io_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:adafruit_io/adafruit_io_helper/http_adafruit_io.dart';

class AdafruitIOHelper implements AdafruitIOAPI {
  AdafruitIOHelper({@required this.username, this.aioKey});

  final String username;
  final String aioKey;
  String _apiProtocol;

  static String httpProtocol;
  static String mqttProtocol;

  set apiProtocol(String value) {
    if (value==httpProtocol) _apiProtocol = httpProtocol;
    else throw UnimplementedError("AdafruitIOHelper isn't implemented for that protocol");
  }

  void sendData(dynamic value) {
    if (_apiProtocol=='http') {
      final helper = HTTPAdafruitIOHelper();
      helper.sendData(value);
    } else {
      throw UnimplementedError("sendData isn't implemented for that protocol");
    }
  }
  void getData(dynamic value) {
    if (_apiProtocol=='http') {
      final helper = HTTPAdafruitIOHelper();
      helper.getData(value);
    } else {
      throw UnimplementedError("getData isn't implemented for that protocol");
    }
  }
}

