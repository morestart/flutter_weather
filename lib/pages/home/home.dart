import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterweather/config/server_url_config.dart';
import 'package:flutterweather/model/weather_model.dart';
import 'package:flutterweather/service/weather_data_service.dart';
import 'package:flutterweather/widget/loading_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weatherModel;

  @override
  void initState() {
    super.initState();
    var params = {"location": "qingdao", "key": ServerConfig.key};
    WeatherDataService().queryWeatherData(params, (success) {
      setState(() {
        weatherModel = success;
      });
    }, (value) {
      print('error in home init');
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 825);
    return weatherModel == null
        ? LoadingDialogWidget()
        : Stack(
            // stack是为了其他组件可以在渐变色的基础上显示出来
            children: <Widget>[
              // 渐变背景色
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.blue, Colors.blue.withOpacity(0.4)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox只设置高度 宽度是根据下面的组件自适应的
                    // 设置宽高,就会根据宽高尺寸来匹配
                    SizedBox(
                      height: ScreenUtil().setHeight(100),
                      width: double.infinity,
                    ),
                    _getLocation(),
                    _getTemAndWeatherCodePic(),
                    _getWindHumPre(),
                    Flexible(
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: weatherModel.heWeather6[0].dailyForecast
                              .map((item) {
//                          print(item);
                            return _getThreeDaysForecast(item);
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  Widget _getLocation() {
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

  Widget _getTemAndWeatherCodePic() {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '${weatherModel.heWeather6[0].now.fl}°C',
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

  Widget _getWindHumPre() {
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 100, 20, 20),
      child: Row(
        children: <Widget>[
          _someMessage(
              icon: 'assets/images/风向.png',
              title: '风向',
              data: weatherModel.heWeather6[0].now.windDeg),
          Padding(
            padding: EdgeInsets.only(right: 20),
          ),
          _someMessage(
              icon: 'assets/images/气压.png',
              title: '气压',
              data: weatherModel.heWeather6[0].now.pcpn),
          Padding(
            padding: EdgeInsets.only(right: 20),
          ),
          _someMessage(
              icon: 'assets/images/湿度.png',
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
          children: <Widget>[
            Text(title,
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(14))),
            SizedBox(
              height: ScreenUtil().setHeight(6),
            ),
            Text(data,
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(14))),
          ],
        ),
      ],
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
