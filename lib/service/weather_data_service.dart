import 'dart:convert';

import 'package:flutterweather/config/WString.dart';
import 'package:flutterweather/config/server_url_config.dart';
import 'package:flutterweather/model/weather_model.dart';
import 'package:flutterweather/util/http_util.dart';

typedef OnSuccessList<T>(List<T> list);

typedef OnSuccess<T>(T t);

typedef OnFail(String message);

class WeatherDataService {
//  请求接口数据
  Future queryWeatherData(
      Map<String, dynamic> params, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response =
          await HttpUtil.instance.get(ServerConfig.BaseUrl, parameters: params);
//      response = json.decode(response);
//      如果等于ok代表请求成功

      if (response["HeWeather6"][0]["status"] == "ok") {
        WeatherModel weatherModel = WeatherModel.fromJson(response);
        onSuccess(weatherModel);
      } else {
        onFail(response["HeWeather6"][0]["status"]);
      }
    } catch (e) {
      onFail(WString.RequestFileError);
      print('*******WeatherDataService*********');
      print(e);
      print('*******WeatherDataService*********');
    }
  }
}
