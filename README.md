# Waether

Simple weather application

## Getting Started

### Run the project
To successfully build the project run:

`flutter pub get`

`flutter pub run build_runner build`

The app has 2 main displays
#### Home Screen
Which contains a list of forecasting. Nothing serious done here
(Added only the basic information)
#### Forecast Screen
Showing simple details of a selected day.

The app is tested on:
* iPhone 11 pro
* iPad pro (9.7 inch)
* Android Pixel 3a API 29

## Architecture

* BLoC
* Provider
* Repository
* DI

I also used immutable values for model serialization.

## Widgets design
* Reusable Widgets are separated in the [widgets](lib/widgets)
  directory.
* Any other widget is private to it's display.

## Tests
I only did a unit test for the
[ForecastClient](test/forecast_api_test.dart) and
[UIUtils](test/ui_utils_test.dart) to showcase the importance of DI even
in small projects.

Run tests by running `flutter test` in the root dir.