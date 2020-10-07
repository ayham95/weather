import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final String code;
  final double size;
  final String heroTag;

  const WeatherImage(
      {Key key, @required this.code, this.size = 100, @required this.heroTag})
      : assert(code != null),
        assert(heroTag != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    print(code);

    return Hero(
      tag: heroTag,
      child: Image.asset(
        'assets/images/$code.png',
        height: size,
      ),
    );
  }
}
