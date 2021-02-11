import 'package:http/http.dart' as http;
import 'package:adafruit_io/adafruit_io_helper/adafruit_io_api.dart';

class HTTPAdafruitIOHelper implements AdafruitIOAPI {
  void sendData(value) => print("http send $value");
  void getData(value) => print('http get $value');
}