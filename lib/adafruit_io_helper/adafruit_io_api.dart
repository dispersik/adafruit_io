import 'package:flutter/cupertino.dart';

class AdafruitIOAPI {
  Future<Map<String, dynamic>> getLastData(Map<String, String> userData) =>
      null;
  Future<List<dynamic>> getFeedData(Map<String, String> userData) => null;
  Future createData(
          Map<String, String> userData, AdafruitIOData data) =>
      null;
}

class AdafruitIOData {
  AdafruitIOData(
      {@required this.value,
        this.createdAt,
        this.lat,
        this.lon,
        this.ele,
        this.expiration,
      });

  AdafruitIOData.fromMap(Map<String, String> map) {
    this.value = map['value'];
    this.createdAt = map['createdAt'];
    this.lat = map['lat'];
    this.lon = map['lon'];
    this.ele = map['ele'];
    this.expiration = map['expiration'];
  }

  String _id;
  String value;
  String _feedId;
  String _feedKey;
  String createdAt;
  String lat;
  String lon;
  String ele;
  String _createdEpoch;
  String expiration;

  Map<String, String> toMap() {
    Map<String, String> map = Map<String, String>();
    map['value'] = value;
    map['createdAt'] = createdAt;
    map['lat'] = lat;
    map['lon'] = lon;
    map['ele'] = ele;
    map['expiration'] = expiration;
    map['id'] = _id;
    map['feedId'] = _feedId;
    map['feedKey'] = _feedKey;
    map['createdEpoch'] = _createdEpoch;
    return map;
  }

  Map<String, String> toExportableMap() {
    Map<String, String> map = Map<String, String>();
    map['value'] = value;
    map['createdAt'] = createdAt;
    map['lat'] = lat;
    map['lon'] = lon;
    map['ele'] = ele;
    map['expiration'] = expiration;
    return map;
  }
}

