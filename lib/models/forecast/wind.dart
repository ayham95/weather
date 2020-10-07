import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'wind.g.dart';

abstract class Wind implements Built<Wind, WindBuilder> {
  Wind._();

  factory Wind([updates(WindBuilder b)]) = _$Wind;

  static Serializer<Wind> get serializer => _$windSerializer;

  double get speed;

  static Wind fromJson(String jsonString) {
    return serializers.deserializeWith(
        Wind.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Wind.serializer, this));
  }
}
