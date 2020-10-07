import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:maidscc_waether/models/serializers.dart';

import 'forecast/main_data.dart';
import 'forecast/weather.dart';
import 'forecast/wind.dart';

part 'forecast.g.dart';

abstract class Forecast implements Built<Forecast, ForecastBuilder> {
  Forecast._();

  factory Forecast([updates(ForecastBuilder b)]) = _$Forecast;

  static Serializer<Forecast> get serializer => _$forecastSerializer;

  MainData get main;

  BuiltList<Weather> get weather;

  @BuiltValueField(wireName: 'dt_txt')
  String get date;

  Wind get wind;

  static Forecast fromJson(String jsonString) {
    return serializers.deserializeWith(
        Forecast.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json
        .encode(serializers.serializeWith(Forecast.serializer, this));
  }
}