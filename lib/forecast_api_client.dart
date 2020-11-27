import 'package:http/http.dart';
import 'package:maidscc_waether/models/forecast.dart';
import 'package:maidscc_waether/models/forecast_list.dart';

class ForecastAPIClient {
  final Client client;
  static const String _base_url =
      'https://api.openweathermap.org/data/2.5/forecast?id=292223&appid=03297d312f41aeb574c6e709d61e33a7'; // APIs secrets shouldn't be here..

  ForecastAPIClient(this.client)
      : assert(
            client != null, 'Please Provide a client to the Network instance');

  Future<List<Forecast>> getData() async {
    try {
      final response = await client.get(_base_url);
      return ForecastList.fromJson(response.body).list.toList();
    } catch (e) {
      throw e;
    }
  }
}
