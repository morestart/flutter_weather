import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterweather/model/weather_model.dart';

class GetWindHumPre extends StatelessWidget {
  WeatherModel weatherModel;
  GetWindHumPre(this.weatherModel);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 100, 20, 20),
      child: Row(
        children: <Widget>[
          _someMessage(
              icon: 'assets/images/windDir.png',
              title: '风向',
              data: weatherModel.heWeather6[0].now.windDeg),
          Padding(
            padding: EdgeInsets.only(right: 20),
          ),
          _someMessage(
              icon: 'assets/images/pre.png',
              title: '气压',
              data: weatherModel.heWeather6[0].now.pres),
          Padding(
            padding: EdgeInsets.only(right: 20),
          ),
          _someMessage(
              icon: 'assets/images/hum.png',
              title: '湿度',
              data: weatherModel.heWeather6[0].now.hum),
        ],
      ),
    );
  }

  Widget _someMessage({String icon, String title, String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(icon, width: ScreenUtil().setWidth(45), fit: BoxFit.fill),
        Padding(padding: EdgeInsets.only(right: 10)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(14)),
//              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(6),
            ),
            Text(
              data,
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(14)),
//              textAlign: TextAlign.left,
            ),
          ],
        ),
      ],
    );
  }
}
