import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:maidscc_waether/ui_utils.dart';

void main() {
  group('Get weather color depending on icon code', () {
    String validCode;
    String invalidCode;

    setUp(() {
      validCode = 'n'; // night
      invalidCode = 'dd';
    });

    test(
        'return a color other than light orange When passing a valid icon code',
        () {
      expect(
          UiUtils.getWeatherColor(validCode), Color.fromARGB(255, 28, 54, 74));
    });

    test('return light orange When passing an invalid icon code', () {
      expect(UiUtils.getWeatherColor(invalidCode),
          Color.fromARGB(255, 255, 182, 142));
    });
  });
}
