import 'dart:io';

import 'package:maidscc_waether/models/forecast.dart';

import '../forecast_api_client.dart';

typedef ErrorCallback = Stream Function(String);

class ForecastRepository {
  List<Forecast> forecasts;
  final ForecastAPIClient forecastAPIClient;

  ForecastRepository(this.forecastAPIClient)
      : assert(forecastAPIClient != null,
  'Please provide a ForecastAPIClient to ForecastRepository instance..');

  Future<List<Forecast>> getForecastData({forceRefresh = false}) async {
    try {
      if (forecasts == null || forceRefresh || forecasts.isEmpty) {
        forecasts = await forecastAPIClient.getData();
      }
//      if (forecasts.isEmpty) throw'';
      return forecasts;
    } on SocketException {
      throw ('Check your internet connection');
    } catch (e) {
      throw(e);
    }
  }
}
