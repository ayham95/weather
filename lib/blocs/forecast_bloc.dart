import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maidscc_waether/models/forecast.dart';
import 'package:maidscc_waether/repositories/forecast_repository.dart';
import 'package:meta/meta.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final ForecastRepository forecastRepository;

  ForecastBloc(this.forecastRepository) : super(ForecastLoading()) {
    this.add(CheckWeather());
  }

  @override
  Stream<ForecastState> mapEventToState(
    ForecastEvent event,
  ) async* {
    if (event is CheckWeather) {
      yield ForecastLoading();
      try {
        List<Forecast> forecasts = await forecastRepository.getForecastData();
        yield ForecastLoaded(forecasts);
      } catch (e) {
        yield ForecastNotLoaded('An error occurred');
      }
    }
  }
}
