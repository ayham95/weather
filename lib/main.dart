import 'package:flutter/material.dart';
import 'package:maidscc_waether/repositories/forecast_repository.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ForecastRepository forecastRepository = ForecastRepository();
  runApp(WeatherApp(forecastRepository: forecastRepository,));
}

