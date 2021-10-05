import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    Response response = await get(
      'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=277ea5e7e84f8b7406a57256fddb61d0',
    );
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);

      var temp = decoded["main"]["temp"];
      var condition = decoded["weather"][0]["id"];
      var name = decoded["name"];
      print([temp, condition, name]);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold();
  }
}
