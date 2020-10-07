part of 'forecast_bloc.dart';

@immutable
abstract class ForecastEvent {}

class CheckWeather extends ForecastEvent {}
