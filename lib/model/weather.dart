import 'package:meta/meta.dart';

class WeatherModel {
  final String citiName;
  final double temperatureCelsius;
  final double temperatureFarenheit;

  WeatherModel({
    this.citiName,
    this.temperatureCelsius,
    this.temperatureFarenheit
  });

  List<Object> get props => [
    citiName,
    temperatureCelsius,
    temperatureFarenheit,
  ];

}