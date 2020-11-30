import 'package:http/http.dart';
import 'package:maidscc_waether/models/forecast.dart';
import 'package:maidscc_waether/models/forecast_list.dart';

class ForecastAPIClient {
  final Client _client;
  static const String _base_url = 'api.openweathermap.org';

  ForecastAPIClient({Client client}) : _client = client ?? Client();

  Future<List<Forecast>> getData() async {
    try {
      // TODO Remove app secret ( you can use --dart-define ) but still won't work with tests...
      final request = Uri.https(_base_url, '/data/2.5/forecast', {
        'id': '292223',
        'appid': '03297d312f41aeb574c6e709d61e33a7',
        'units': 'metrics',
      });
      final response = await _client.get(request);
      return ForecastList.fromJson(response.body).list.toList();
    } catch (e) {
      throw e;
    }
  }
}
