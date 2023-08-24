import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';

import '../services/weather.dart';
import '../utils/globals.dart';
import '../utils/myrefresh.dart';
import '../services/location_class.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  Location location = Location();
  Map weatherData = {};
  Map temp = {
    "temp": 0,
    "tempC": 0,
    "tempF": 0,
    "tempIcon": "",
  };
  String cityName = "";
  String weatherIcon = "";
  String weatherDescription = "";

  void updateUI(Map weatherData) {
    try{
      weatherData = weatherData["weatherData"];
    } catch(e){
      weatherData = weatherData;
    }

    if (weatherData['error'] != null){
      setState(() {
        cityName = weatherData['error'].toString();
      });
      return;
    }

    setState(() {
      temp["temp"] = weatherData["main"]["temp"];
      temp["tempC"] = temp["temp"] - 273.15;
      temp["tempF"] = temp["temp"] * 9 / 5 - 459.67;
      temp["tempIcon"] = Weather().getTemperatureIcon(temp["tempC"]);
      cityName = weatherData["name"];
      weatherIcon = Weather().getWeatherIcon(weatherData["weather"][0]["id"]);
      weatherDescription = StringUtils.capitalize(weatherData["weather"][0]["description"]);
      weatherDescription += " $weatherIcon";
    });
  }

  Future<void> pullRefresh() async {
    getLocation();
  }

  void getLocation([String cityNameForm=""]) async {
    if (cityNameForm.isEmpty){
      await location.getLocation();
    }
    await location.getWeather(cityNameForm);

    setState(() {
      weatherData = location.weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (weatherData.isEmpty){
      weatherData = ModalRoute.of(context)!.settings.arguments as Map;
    }
    updateUI(weatherData);

    return Scaffold(
      body: MyRefresh(
        onRefresh: pullRefresh,
        child: Center(
          child: !location.permission ? Text(
            location.permMessage,
            textAlign: TextAlign.center,
            style: kWeatherMedium,
          ) : Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/location_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 50.0,
                horizontal: 20.0,
              ),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 46, 46, 46).withOpacity(0.9),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: cityName),
                          onSubmitted: (value) => getLocation(value),
                          style: kWeatherMediumForm,
                          decoration: kTextFieldDecoration,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        temp["tempIcon"],
                        style: kWeatherLarge
                      ),
                      Column(
                        children: [
                          Text(
                            temp["tempC"].toStringAsFixed(1) + "°C",
                            style: kWeatherHuge,
                          ),
                          Text(
                            temp["tempF"].toStringAsFixed(1) + "°F",
                            style:kWeatherMedium
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    weatherDescription,
                    style: kWeatherMedium,
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
