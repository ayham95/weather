import'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';

import '../serializers.dart';

part 'main_data.g.dart';

abstract class MainData implements Built<MainData, MainDataBuilder> {
  MainData._();

  factory MainData([updates(MainDataBuilder b)]) = _$MainData;

  static Serializer<MainData> get serializer => _$mainDataSerializer;

  double get temp;
  @BuiltValueField(wireName: 'feels_like')
  double get feelsLike;
  @BuiltValueField(wireName: 'temp_min')
  double get tempMin;
  @BuiltValueField(wireName: 'temp_max')
  double get tempMax;
  double get pressure;
  @BuiltValueField(wireName: 'sea_level')
  double get seaLevel;
  @BuiltValueField(wireName: 'grnd_level')
  double get grndLevel;
  double get humidity;


  static MainData fromJson(String jsonString) {
    return serializers.deserializeWith(
        MainData.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json
        .encode(serializers.serializeWith(MainData.serializer, this));
  }
}