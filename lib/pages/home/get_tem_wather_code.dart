import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterweather/model/weather_model.dart';

class GetTemAndWeatherCode extends StatelessWidget {
  WeatherModel weatherModel;
  GetTemAndWeatherCode(this.weatherModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '${weatherModel.heWeather6[0].now.fl}°',
            style: TextStyle(fontSize: 90.0, color: Colors.white),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(40),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              weatherModel.heWeather6[0].now.condCode == null
                  ? Container()
                  : Image.asset(
                      'assets/images/${weatherModel.heWeather6[0].now.condCode}.png',
                      color: Colors.white,
                      height: ScreenUtil().setHeight(60),
                    ),
//                              SizedBox(height: 10.0),
              Text(
                '${weatherModel.heWeather6[0].now.condTxt}',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
