import'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';

import '../serializers.dart';

part 'main_data.g.dart';

abstract class MainData implements Built<MainData, MainDataBuilder> {
  MainData._();

  factory MainData([updates(MainDataBuilder b)]) = _$MainData;

  static Serializer<MainData> get serializer => _$mainDataSerializer;


  static MainData fromJson(String jsonString) {
    return serializers.deserializeWith(
        MainData.serializer, json.decode(jsonString));
  }

  String toJson() {
    return json
        .encode(serializers.serializeWith(MainData.serializer, this));
  }
}