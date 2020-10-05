import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:maidscc_waether/models/serializers.dart';
import 'dart:convert';

import 'forecast/main_data.dart';
import 'forecast/weather.dart';


part 'forecast.g.dart';

abstract class Forecast implements Built<Forecast, ForecastBuilder> {
  Forecast._();

  factory Forecast([updates(ForecastBuilder b)]) = _$Forecast;

  static Serializer<Forecast> get serializer => _$forecastSerializer;

  MainData get main;
  Weather get weather;



  static Forecast fromJson(String jsonString) {
    return serializers.deserializeWith(
        Forecast.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json
        .encode(serializers.serializeWith(Forecast.serializer, this));
  }
}