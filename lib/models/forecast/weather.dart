import'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';

import '../serializers.dart';

part 'weather.g.dart';

abstract class Weather implements Built<Weather, WeatherBuilder> {
  Weather._();

  factory Weather([updates(WeatherBuilder b)]) = _$Weather;

  static Serializer<Weather> get serializer => _$weatherSerializer;




  static Weather fromJson(String jsonString) {
    return serializers.deserializeWith(
        Weather.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json
        .encode(serializers.serializeWith(Weather.serializer, this));
  }
}