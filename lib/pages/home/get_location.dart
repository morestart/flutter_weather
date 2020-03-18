import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterweather/model/weather_model.dart';

class GetLocation extends StatelessWidget {
  WeatherModel weatherModel;
  GetLocation(this.weatherModel);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '${weatherModel.heWeather6[0].basic.location}',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(60),
            color: Colors.white,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
