import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:maidscc_waether/models/serializers.dart';

import 'forecast.dart';

part 'forecast_list.g.dart';

abstract class ForecastList
    implements Built<ForecastList, ForecastListBuilder> {
  ForecastList._();

  factory ForecastList([updates(ForecastListBuilder b)]) = _$ForecastList;

  static Serializer<ForecastList> get serializer => _$forecastListSerializer;

  BuiltList<Forecast> get list;

  static ForecastList fromJson(String jsonString) {
    return serializers.deserializeWith(
        ForecastList.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json
        .encode(serializers.serializeWith(ForecastList.serializer, this));
  }
}
