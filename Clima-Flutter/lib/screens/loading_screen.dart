import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool hasError = false;

  void getLocation() async {
    WeatherModel wm = WeatherModel();
    var data = await wm.getLocationWeather();
    if (data != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(weatherData: data),
        ),
      );
    } else {
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hasError
          ? SpinKitDoubleBounce(
              color: Colors.white,
              size: 100.0,
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong. Check if location services are enabled or try again later.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
