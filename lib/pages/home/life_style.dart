import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterweather/config/life_style_code.dart';
import 'package:flutterweather/model/weather_model.dart';

class LifeStyle extends StatefulWidget {
  WeatherModel weatherModel;

  LifeStyle(this.weatherModel);

  @override
  _LifeStyleState createState() => _LifeStyleState();
}

class _LifeStyleState extends State<LifeStyle> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
        color: Color.fromRGBO(250, 250, 250, 1),
//        color: Colors.amber,
        child: Column(
          children: <Widget>[
            Text(
              '生活指数',
              style: TextStyle(fontSize: ScreenUtil().setSp(16)),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.weatherModel.heWeather6[0].lifestyle.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 5 / 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return getLifeStyleWidget(
                    widget.weatherModel.heWeather6[0].lifestyle[index]);
              },
            )
          ],
        ));
  }

  Widget getLifeStyleWidget(var lifeStyleModel) {
    return Container(
//      color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/${LifeStyleCode().lifeStyleCode[lifeStyleModel.type]}.png',
            width: 30,
            height: 30,
          ),
          Padding(padding: EdgeInsets.only(right: 15)),
          Container(
//            color: Colors.white,
            height: ScreenUtil().setHeight(60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  LifeStyleCode().lifeStyleCode[lifeStyleModel.type],
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Text(
                  lifeStyleModel.brf,
                  style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
