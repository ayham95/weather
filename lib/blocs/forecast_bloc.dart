import 'dart:async';

import 'package:bloc/bloc.dart';
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

        // There's always a better way.. But for the sake of this example..
        final filteredForecasts = [
          forecasts.firstWhere((element) =>
              DateTime.parse(element.date).day == DateTime.now().day),
          forecasts.firstWhere((element) =>
              DateTime.parse(element.date).day == DateTime.now().day + 1),
          forecasts.firstWhere((element) =>
              DateTime.parse(element.date).day == DateTime.now().day + 2),
        ];

        yield ForecastLoaded(filteredForecasts);
      } catch (e) {
        yield ForecastNotLoaded('An error occurred');
      }
    }
  }
}
