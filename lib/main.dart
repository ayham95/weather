import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:maidscc_waether/forecast_api_client.dart';
import 'package:maidscc_waether/repositories/forecast_repository.dart';

import 'app.dart';
import 'blocs/forecast_bloc.dart';
import 'display/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(WeatherApp());
}

