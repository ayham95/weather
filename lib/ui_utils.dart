import 'dart:ui';

class UiUtils {
  static Color getWeatherColor(String code) {
    if (code.contains('n')) return Color.fromARGB(255, 28, 54, 74);
    if (code.contains('9') ||
        code.contains('10') ||
        code.contains('11') ||
        code.contains('13') ||
        code.contains('50')) return Color.fromARGB(255, 155, 231, 238);
    if (code.contains('2') || code.contains('3') || code.contains('4'))
      return Color.fromARGB(255, 132, 233, 204);
    else
      return Color.fromARGB(255, 255, 182, 142);
  }
}
