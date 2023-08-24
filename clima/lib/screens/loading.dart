import 'package:flutter/material.dart';

import '../services/location_class.dart';
import '../utils/globals.dart';
import '../utils/myrefresh.dart';

class LoadingScreen extends StatefulWidget {

  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> pullRefresh() async {
    setState(() {
      getLocation();
    });
  }

  void getLocation() async {
    await location.getLocation();
    await location.getWeather();
    setState(() {
      location = location;
    });

    if (location.permission) {
      locationNav();
    }
  }

  void locationNav(){
    Navigator.pushNamed(
      context,
      '/location',
      arguments: {
        "weatherData": location.weatherData,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyRefresh(
        onRefresh: pullRefresh,
        child: Center(
          child: location.permission ? const CircularProgressIndicator(
            color: Colors.white,
          ) : Text(
            location.permMessage,
            textAlign: TextAlign.center,
            style: kWeatherMedium,
          ),
        ),
      ),
    );
  }
}
