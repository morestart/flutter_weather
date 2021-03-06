import 'package:json_annotation/json_annotation.dart';
//  flutter packages pub run build_runner build
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Object {
  @JsonKey(name: 'HeWeather6')
  List<HeWeather6> heWeather6;

  WeatherModel(
    this.heWeather6,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> srcJson) =>
      _$WeatherModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class HeWeather6 extends Object {
  @JsonKey(name: 'basic')
  Basic basic;

  @JsonKey(name: 'update')
  Update update;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'now')
  Now now;

  @JsonKey(name: 'daily_forecast')
  List<Daily_forecast> dailyForecast;

  @JsonKey(name: 'lifestyle')
  List<Lifestyle> lifestyle;

  HeWeather6(
    this.basic,
    this.update,
    this.status,
    this.now,
    this.dailyForecast,
    this.lifestyle,
  );

  factory HeWeather6.fromJson(Map<String, dynamic> srcJson) =>
      _$HeWeather6FromJson(srcJson);

  Map<String, dynamic> toJson() => _$HeWeather6ToJson(this);
}

@JsonSerializable()
class Basic extends Object {
  @JsonKey(name: 'cid')
  String cid;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'parent_city')
  String parentCity;

  @JsonKey(name: 'admin_area')
  String adminArea;

  @JsonKey(name: 'cnty')
  String cnty;

  @JsonKey(name: 'lat')
  String lat;

  @JsonKey(name: 'lon')
  String lon;

  @JsonKey(name: 'tz')
  String tz;

  Basic(
    this.cid,
    this.location,
    this.parentCity,
    this.adminArea,
    this.cnty,
    this.lat,
    this.lon,
    this.tz,
  );

  factory Basic.fromJson(Map<String, dynamic> srcJson) =>
      _$BasicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BasicToJson(this);
}

@JsonSerializable()
class Update extends Object {
  @JsonKey(name: 'loc')
  String loc;

  @JsonKey(name: 'utc')
  String utc;

  Update(
    this.loc,
    this.utc,
  );

  factory Update.fromJson(Map<String, dynamic> srcJson) =>
      _$UpdateFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UpdateToJson(this);
}

@JsonSerializable()
class Now extends Object {
  @JsonKey(name: 'cloud')
  String cloud;

  @JsonKey(name: 'cond_code')
  String condCode;

  @JsonKey(name: 'cond_txt')
  String condTxt;

  @JsonKey(name: 'fl')
  String fl;

  @JsonKey(name: 'hum')
  String hum;

  @JsonKey(name: 'pcpn')
  String pcpn;

  @JsonKey(name: 'pres')
  String pres;

  @JsonKey(name: 'tmp')
  String tmp;

  @JsonKey(name: 'vis')
  String vis;

  @JsonKey(name: 'wind_deg')
  String windDeg;

  @JsonKey(name: 'wind_dir')
  String windDir;

  @JsonKey(name: 'wind_sc')
  String windSc;

  @JsonKey(name: 'wind_spd')
  String windSpd;

  Now(
    this.cloud,
    this.condCode,
    this.condTxt,
    this.fl,
    this.hum,
    this.pcpn,
    this.pres,
    this.tmp,
    this.vis,
    this.windDeg,
    this.windDir,
    this.windSc,
    this.windSpd,
  );

  factory Now.fromJson(Map<String, dynamic> srcJson) => _$NowFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NowToJson(this);
}

@JsonSerializable()
class Daily_forecast extends Object {
  @JsonKey(name: 'cond_code_d')
  String condCodeD;

  @JsonKey(name: 'cond_code_n')
  String condCodeN;

  @JsonKey(name: 'cond_txt_d')
  String condTxtD;

  @JsonKey(name: 'cond_txt_n')
  String condTxtN;

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'hum')
  String hum;

  @JsonKey(name: 'mr')
  String mr;

  @JsonKey(name: 'ms')
  String ms;

  @JsonKey(name: 'pcpn')
  String pcpn;

  @JsonKey(name: 'pop')
  String pop;

  @JsonKey(name: 'pres')
  String pres;

  @JsonKey(name: 'sr')
  String sr;

  @JsonKey(name: 'ss')
  String ss;

  @JsonKey(name: 'tmp_max')
  String tmpMax;

  @JsonKey(name: 'tmp_min')
  String tmpMin;

  @JsonKey(name: 'uv_index')
  String uvIndex;

  @JsonKey(name: 'vis')
  String vis;

  @JsonKey(name: 'wind_deg')
  String windDeg;

  @JsonKey(name: 'wind_dir')
  String windDir;

  @JsonKey(name: 'wind_sc')
  String windSc;

  @JsonKey(name: 'wind_spd')
  String windSpd;

  Daily_forecast(
    this.condCodeD,
    this.condCodeN,
    this.condTxtD,
    this.condTxtN,
    this.date,
    this.hum,
    this.mr,
    this.ms,
    this.pcpn,
    this.pop,
    this.pres,
    this.sr,
    this.ss,
    this.tmpMax,
    this.tmpMin,
    this.uvIndex,
    this.vis,
    this.windDeg,
    this.windDir,
    this.windSc,
    this.windSpd,
  );

  factory Daily_forecast.fromJson(Map<String, dynamic> srcJson) =>
      _$Daily_forecastFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Daily_forecastToJson(this);
}

@JsonSerializable()
class Lifestyle extends Object {
  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'brf')
  String brf;

  @JsonKey(name: 'txt')
  String txt;

  Lifestyle(
    this.type,
    this.brf,
    this.txt,
  );

  factory Lifestyle.fromJson(Map<String, dynamic> srcJson) =>
      _$LifestyleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LifestyleToJson(this);
}
