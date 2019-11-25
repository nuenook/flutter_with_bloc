import 'dart:math';

import 'package:bloc_counter/model/weather.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeather(String citiName);
  Future<WeatherModel> fetchDetailedWeather(String citiName);
}

class FakeWeatherRepository implements WeatherRepository {
  double cachedTempCelsius;

  @override
  Future<WeatherModel> fetchWeather(String citiName) {
    return Future.delayed(Duration(seconds: 3), () {
      final random = Random();

      if (random.nextBool()) {
        throw NetworkError();
      }

      cachedTempCelsius = 20 + random.nextInt(15) + random.nextDouble();

      return WeatherModel(
          citiName: citiName, temperatureCelsius: cachedTempCelsius);
    });
  }

  @override
  Future<WeatherModel> fetchDetailedWeather(String citiName) {
    return Future.delayed(
        Duration(seconds: 1),
        () => WeatherModel(
            citiName: citiName,
            temperatureCelsius: cachedTempCelsius,
            temperatureFarenheit: cachedTempCelsius * 1.8 + 32));
  }
}

class NetworkError extends Error {}
