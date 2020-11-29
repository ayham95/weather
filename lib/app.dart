import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:maidscc_waether/repositories/forecast_repository.dart';

import 'blocs/forecast_bloc.dart';
import 'display/home_screen.dart';
import 'forecast_api_client.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Client client;
  ForecastAPIClient forecastAPIClient;
  ForecastRepository forecastRepository;

  @override
  void initState() {
    forecastRepository = ForecastRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      home: HomeScreen(ForecastBloc(forecastRepository)),
      // DI could also be provided through a provided, but the app is too simple for that.
      theme: ThemeData(
          fontFamily: 'JosefinSans',
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            headline4:
            TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
    );
  }
}
