import 'dart:io';

import 'package:maidscc_waether/models/forecast.dart';

import '../forecast_api_client.dart';

class ForecastRepository {
  List<Forecast> forecasts;
  final ForecastAPIClient _forecastAPIClient;

  ForecastRepository({ForecastAPIClient forecastAPIClient})
      : _forecastAPIClient = forecastAPIClient ?? ForecastAPIClient();

  Future<List<Forecast>> getForecastData({forceRefresh = false}) async {
    try {
      if (forecasts == null || forceRefresh || forecasts.isEmpty) {
        forecasts = await _forecastAPIClient.getData();
      }
      return forecasts;
    } on SocketException {
      throw 'Check your internet connection';
    } catch (e) {
      throw 'An error occurred';
    }
  }
}
