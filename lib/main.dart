import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:adafruit_io/adafruit_io_helper/adafruit_io_helper.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(AdafruitIOHelperApp());
}

class AdafruitIOHelperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AdafruitIOHelper helper = AdafruitIOHelper(
    username: 'user', aioKey: 'key'
  );

  _getLastData() async {
    var username = 'maxworm';
    var feedKey = 'test';
    var aioKey = 'aio_GERM39No0g96dvkoRPlEhPVwi050';

    var url = 'https://io.adafruit.com/api/v2/$username/feeds/$feedKey/data/last';
    var response = await http.get(url, headers: {'X-AIO-Key': aioKey});
    var content = jsonDecode(response.body);
    var type = content.runtimeType;
    print('response type is $type\nresponse content:\n$content');
    print(content is Map<String, dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adafruit IO Helper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: ()=> helper.sendData('42'), child: Text('send')),
            ElevatedButton(onPressed: ()=> _getLastData(), child: Text('get'))
          ],
        ),
      ),
    );
  }
}
