// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@Freezed()
class DataResponse with _$DataResponse {
  factory DataResponse({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) = _DataResponse;

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);
}

@Freezed()
class Clouds with _$Clouds {
  factory Clouds({
    int? all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@Freezed()
class Coord with _$Coord {
  factory Coord({
    double? lon,
    double? lat,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@Freezed()
class Main with _$Main {
  factory Main({
    double? temp,
    @JsonKey(name: "feels_like") double? feelsLike,
    @JsonKey(name: "temp_min") double? tempMin,
    @JsonKey(name: "temp_max") double? tempMax,
    int? pressure,
    int? humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@Freezed()
class Rain with _$Rain {
  factory Rain({
    double? the1h,
  }) = _Rain;

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}

@Freezed()
class Sys with _$Sys {
  factory Sys(
      {int? type, int? id, String? country, int? sunrise, int? sunset}) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@Freezed()
class Weather with _$Weather {
  factory Weather({int? id, String? main, String? description, String? icon}) =
  _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@Freezed()
class Wind with _$Wind {
  factory Wind({
    double? speed,
    int? deg,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
