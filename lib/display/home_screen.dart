import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maidscc_waether/blocs/forecast_bloc.dart';
import 'package:maidscc_waether/models/forecast.dart';
import 'package:maidscc_waether/widgets/temperature_text.dart';
import 'package:maidscc_waether/widgets/weather_image.dart';

import '../ui_utils.dart';
import 'forecast_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(builder: (ctx, state) {
      if (state is ForecastNotLoaded) {
        return _ErrorScreen(errorMsg: state.errorMsg);
      }
      return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        primary: true,
        body: state is ForecastLoaded
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: WeatherCard(
                        forecast: state.forecasts[index],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => BlocProvider.value(
                                value: BlocProvider.of<ForecastBloc>(context),
                                child: ForecastScreen(
                                  forecast: state.forecasts[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  itemCount: state.forecasts.length,
                  padding: EdgeInsets.all(0),
                ))
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      );
    });
  }
}

class WeatherCard extends StatelessWidget {
  final Forecast forecast;
  final Function onTap;

  const WeatherCard({Key key, @required this.forecast, this.onTap})
      : assert(forecast != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(forecast.date);
    final String day = date.day == DateTime.now().day
        ? "Today at ${DateFormat.jm().format(date)}"
        : "${DateFormat('EEEE').format(date)} at ${DateFormat.jm().format(date)}";
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: UiUtils.getWeatherColor(forecast.weather.first.icon),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              right: 16,
              child: WeatherImage(
                heroTag: forecast.date,
                code: forecast.weather.first.icon,
                size: MediaQuery.of(context).size.height / 5,
              ),
            ),
            Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(day),
                    SizedBox(
                      height: 8,
                    ),
                    TemperatureText(
                      temp: forecast.main.temp.ceil().toString(),
                      size: MediaQuery.of(context).size.height / 15,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  final String errorMsg;

  const _ErrorScreen({Key key, this.errorMsg = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                errorMsg,
                style: TextStyle(color: Colors.black),
              ),
              FlatButton(
                  onPressed: () => BlocProvider.of<ForecastBloc>(context)
                      .add(CheckWeather()),
                  child: Text(
                    'Retry',
                    style: TextStyle(color: Colors.redAccent),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
