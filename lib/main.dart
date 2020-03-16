import 'package:flutter/material.dart';
import 'package:flutterweather/config/server_url_config.dart';
import 'package:flutterweather/model/weather_model.dart';
import 'package:flutterweather/pages/home/home.dart';
import 'package:flutterweather/service/weather_data_service.dart';
import 'package:flutterweather/util/shared_preference_util.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
