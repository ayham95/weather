part of 'forecast_bloc.dart';

@immutable
abstract class ForecastState extends Equatable {}

class ForecastLoading extends ForecastState {
  @override
  // TODO: implement props
  List<Object> get props => ['ForecastLoading'];
}

class ForecastLoaded extends ForecastState {
  final List<Forecast> forecasts;

  ForecastLoaded(this.forecasts);

  @override
  // TODO: implement props
  List<Object> get props => ['ForecastLoaded'];
}

class ForecastNotLoaded extends ForecastState {
  final String errorMsg;

  ForecastNotLoaded(this.errorMsg);

  @override
  // TODO: implement props
  List<Object> get props => ['ForecastNotLoaded'];
}
