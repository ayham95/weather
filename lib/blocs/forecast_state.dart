part of 'forecast_bloc.dart';

@immutable
abstract class ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  final List<Forecast> forecasts;

  ForecastLoaded(this.forecasts);
}

class ForecastNotLoaded extends ForecastState {
  final String errorMsg;

  ForecastNotLoaded(this.errorMsg);
}
