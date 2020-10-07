library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:maidscc_waether/models/forecast.dart';
import 'package:maidscc_waether/models/forecast/main_data.dart';
import 'package:maidscc_waether/models/forecast/weather.dart';
import 'package:maidscc_waether/models/forecast/wind.dart';
import 'package:maidscc_waether/models/forecast_list.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Forecast,
  MainData,
  Weather,
  ForecastList,
  Wind,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
