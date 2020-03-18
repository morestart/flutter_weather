import 'package:flutter/material.dart';
import 'package:flutterweather/model/weather_model.dart';

class DailyForecast extends StatelessWidget {
  WeatherModel weatherModel;
  DailyForecast(this.weatherModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      color: Color.fromRGBO(250, 250, 250, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weatherModel.heWeather6[0].dailyForecast.map((item) {
//                          print(item);
          return _getThreeDaysForecast(item);
        }).toList(),
      ),
    );
  }

  Widget _getThreeDaysForecast(Daily_forecast dailyForecast) {
//    String date =
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('${dailyForecast.date.substring(5)}',
              style: TextStyle(color: Color(0xff8a8a8a))),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0),
            child: Image.asset(
              'assets/images/${dailyForecast.condCodeD}.png',
              color: Colors.blue,
              height: 56,
            ),
          ),
          Text(dailyForecast.condTxtD,
              style: TextStyle(color: Color(0xff8a8a8a))),
          Padding(
            padding: EdgeInsets.only(top: 1.0),
            child: Text(
                dailyForecast.tmpMin + '℃~' + dailyForecast.tmpMax + '℃',
                style: TextStyle(color: Color(0xff8a8a8a))),
          ),
        ],
      ),
    );
  }
}
