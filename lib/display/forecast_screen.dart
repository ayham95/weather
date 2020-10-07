import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maidscc_waether/ui_utils.dart';
import 'package:maidscc_waether/widgets/temperature_text.dart';
import 'package:maidscc_waether/widgets/weather_image.dart';

import '../models/forecast.dart';

class ForecastScreen extends StatelessWidget {
  final Forecast forecast;

  const ForecastScreen({Key key, @required this.forecast})
      : assert(forecast != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60),
        width: MediaQuery.of(context).size.width,
        color: UiUtils.getWeatherColor(forecast.weather.first.icon),
        child: Stack(
          children: [
            Positioned(
              left: 30,
              right: 1,
              top: MediaQuery.of(context).size.height / 5,
              child: WeatherImage(
                code: forecast.weather.first.icon,
                heroTag: forecast.date,
                size: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: _Description(
                    text: forecast.weather.first.description,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: _ForecastCity(city: 'Dubai'),
                    ),
                    _DetailsList(
                      temp: forecast.main.temp.ceil().toString(),
                      wind: '${forecast.wind.speed}km/h',
                      humidity: '${forecast.main.humidity.toInt()}%',
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ForecastCity extends StatelessWidget {
  final String city;

  const _ForecastCity({Key key, @required this.city})
      : assert(city != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.locationArrow,
          size: 14,
          color: Colors.white70,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          city,
          style: TextStyle(
              color: Colors.white, fontSize: 36, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  final String text;

  const _Description({Key key, @required this.text})
      : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.replaceAll(' ', '\n'),
      style: Theme.of(context).textTheme.headline4,
    ); // Used [replaceAll] because it's a short text..
  }
}

class _DetailsList extends StatelessWidget {
  final String temp;
  final String wind;
  final String humidity;

  const _DetailsList(
      {Key key,
      @required this.temp,
      @required this.wind,
      @required this.humidity})
      : assert(temp != null),
        assert(wind != null),
        assert(humidity != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: ListView(
        children: [
          TemperatureText(
            temp: temp,
            size: MediaQuery.of(context).size.height / 9,
          ),
          SizedBox(
            width: 32,
          ),
          _DescriptionCard(
            title: 'Wind',
            value: wind,
          ),
          _DescriptionCard(
            title: 'Humidity',
            value: humidity,
          ),
        ],
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 32),
      ),
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  final String title;
  final String value;

  const _DescriptionCard({Key key, @required this.title, @required this.value})
      : assert(title != null),
        assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: MediaQuery.of(context).size.height / 60),
            ),
            Text(
              value,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 45,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
