import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  final String temp;
  final double size;

  const TemperatureText({Key key, this.temp, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temp,
          style: TextStyle(
              fontSize: size,
              height: 0.9,
              color: Colors.white,
              fontWeight: FontWeight.w300),
        ),
        _DegreeIcon(),
      ],
    );
  }
}

class _DegreeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height / 10 / 5,
      height: MediaQuery.of(context).size.height / 10 / 5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 4, color: Colors.white)),
    );
  }
}
