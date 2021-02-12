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
      username: 'user',
      aioKey: 'key',
      feed: 'test'
  );

  _getSomeData() async {
    print(await helper.getFeedData());
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
            ElevatedButton(onPressed: () => {}, child: Text('send')),
            ElevatedButton(onPressed: () => _getSomeData(), child: Text('get'))
          ],
        ),
      ),
    );
  }
}
