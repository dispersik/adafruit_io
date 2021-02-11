import 'package:test/test.dart';
import 'package:adafruit_io/adafruit_io_helper/http_adafruit_io.dart';


void main() {
  group('HTTP testing', () {
    test('get result should be "http get value"', () {
      expect(HTTPAdafruitIOHelper().getData('value'), 'http get value');
    });
  });
}
