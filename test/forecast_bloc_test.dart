import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maidscc_waether/blocs/forecast_bloc.dart';
import 'package:maidscc_waether/repositories/forecast_repository.dart';

void main() {
  group('Forecast Bloc', () {
    ForecastBloc forecastBloc;
    setUp(() {
      forecastBloc = ForecastBloc(ForecastRepository());
    });

    blocTest('Emits Loading when forecast bloc is initiated',
        build: () => forecastBloc,
        expect: [ForecastLoading(), ForecastLoaded([])]);
  });
}
