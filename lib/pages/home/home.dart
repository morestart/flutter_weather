import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterweather/config/server_url_config.dart';
import 'package:flutterweather/model/weather_model.dart';
import 'package:flutterweather/pages/home/get_daily_forecast.dart';
import 'package:flutterweather/pages/home/get_location.dart';
import 'package:flutterweather/pages/home/get_tem_wather_code.dart';
import 'package:flutterweather/pages/home/get_wind_hum_pre.dart';
import 'package:flutterweather/pages/home/life_style.dart';
import 'package:flutterweather/service/weather_data_service.dart';
import 'package:flutterweather/widget/loading_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weatherModel;
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    _queryWeatherData();
  }

  _queryWeatherData() {
    var params = {"location": "qingdao", "key": ServerConfig.key};
    WeatherDataService().queryWeatherData(params, (success) {
      setState(() {
        weatherModel = success;
      });
      _controller.finishRefresh();
    }, (value) {
      print('error in home init');
      _controller.finishRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 825);
    return weatherModel == null
        ? LoadingDialogWidget()
        : EasyRefresh(
            header: BezierCircleHeader(backgroundColor: Colors.redAccent),
            footer: BezierBounceFooter(backgroundColor: Colors.redAccent),
            enableControlFinishRefresh: true,
            enableControlFinishLoad: false,
            onRefresh: () async {
              _queryWeatherData();
              _controller.finishRefresh();
            },
            child: SingleChildScrollView(
              child: Stack(
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
                        GetLocation(weatherModel),
                        GetTemAndWeatherCode(weatherModel),
                        GetWindHumPre(weatherModel),
                        DailyForecast(weatherModel),
                        LifeStyle(weatherModel)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
