import 'package:geolocator/geolocator.dart';

import 'networking.dart';
import '../utils/globals.dart';

class Location{
  double _latitude = 0.0;
  double _longitude = 0.0;
  bool _permission = true;
  String _permMessage = "Something went wrong.";
  Map _weatherData = {};
  static const String _openWeatherURL = "https://api.openweathermap.org/data/2.5/weather/";
  static const String _appid = "<appid>";

  Location();

  double get latitude => _latitude;
  double get longitude => _longitude;
  bool get permission => _permission;
  String get permMessage => _permMessage;
  Map get weatherData => _weatherData;
  String get openWeatherURL => _openWeatherURL;

  /// Get the current location of the device.
  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low
      );
      _latitude = position.latitude;
      _longitude = position.longitude;
      _permission = true;
      _permMessage = "Permission granted.";
    } catch (e) {
      _permission = false;
      _permMessage = "Permission denied.\n${e.toString()}";
    }
  }

  Future<void> getWeather([String cityName=""]) async {
    Map response;

    if (cityName == ""){
      response = await Network(
        "$_openWeatherURL?lat=${_latitude.toString()}&lon=${_longitude.toString()}&appid=$_appid"
      ).getData();
    }
    else{
      response = await Network(
        "$_openWeatherURL?q=$cityName&appid=$_appid"
      ).getData();
    }

    if (response["error"] == null){
      _weatherData = response;
    }
    else {
      _permMessage = "Error: ${response["error"]}\n${errorDictionary[response["error"]]}";
      _permission = false;
      _weatherData = {};
    }
  }
}
