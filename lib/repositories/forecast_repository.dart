import 'package:maidscc_waether/models/forecast.dart';

import '../forecast_api_client.dart';

typedef ErrorCallback = Function(String);

class ForecastRepository {
  List<Forecast> forecasts;
  final ForecastAPIClient forecastAPIClient;

  ForecastRepository(this.forecastAPIClient)
      : assert(forecastAPIClient != null,
            'Please provide a ForecastAPIClient to ForecastRepository instance..');

  Future<List<Forecast>> getForecastData(
      {forceRefresh = false, ErrorCallback errorCallback}) async {
    try {
      if (forecasts == null || forceRefresh) {
        forecasts = await forecastAPIClient.getData();
      }
      return forecasts;
    } catch (e) {
      errorCallback(e);
      throw 'Use ErrorCallback to get the error response';
    }
  }
}
