import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:maidscc_waether/forecast_api_client.dart';
import 'package:maidscc_waether/models/forecast.dart';
import 'package:mockito/mockito.dart';

class MockForecastClient extends Mock implements http.Client {}

const String _base_url =
    'https://api.openweathermap.org/data/2.5/forecast?id=292223&appid=03297d312f41aeb574c6e709d61e33a7';

const String response =
    '{"cod": "200","message": 0,"cnt": 40,"list": [{"dt": 1602082800,"main": {"temp": 305.99,"feels_like": 308.66,"temp_min": 304.34,"temp_max": 305.99,"pressure": 1009,"sea_level": 1009,"grnd_level": 1007,"humidity": 58,"temp_kf": 1.65},"weather": [{"id": 800,"main": "Clear","description": "clear sky","icon": "01n"}],"clouds": {"all": 0},"wind": {"speed": 4.06,"deg": 357},"visibility": 10000,"pop": 0,"sys": {"pod": "n"},"dt_txt": "2020-10-07 15:00:00"}]}';

void main() {
  group('Fetch Forecasts', () {
    MockForecastClient client;
    ForecastAPIClient forecastAPIClient;

    setUp(() {
      client = MockForecastClient();
      forecastAPIClient = ForecastAPIClient(client);
    });

    test('returns a List of Forecasts if the http call completes successfully',
        () async {
      when(client.get(_base_url))
          .thenAnswer((_) async => http.Response(response, 200));

      expect(await forecastAPIClient.getData(), isA<List<Forecast>>());
    });

    test('Throws an exception if the http call completes with an error',
        () async {
      when(client.get(_base_url))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(forecastAPIClient.getData(), throwsException);
    });
  });
}
