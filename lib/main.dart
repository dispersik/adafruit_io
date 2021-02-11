import 'package:flutter/material.dart';
import 'package:adafruit_io/adafruit_io_helper/adafruit_io_helper.dart';

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
            ElevatedButton(onPressed: ()=> helper.getData('1337'), child: Text('get'))
          ],
        ),
      ),
    );
  }
}
