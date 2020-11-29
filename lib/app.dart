import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maidscc_waether/repositories/forecast_repository.dart';

import 'blocs/forecast_bloc.dart';
import 'display/home_screen.dart';

class WeatherApp extends StatefulWidget {
  final ForecastRepository forecastRepository;

  const WeatherApp({Key key, this.forecastRepository}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      home: BlocProvider(
        create: (c) => ForecastBloc(widget.forecastRepository),
        child: HomeScreen(),
      ),
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
