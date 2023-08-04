import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = '4b6d0397609297c2ad97c93bdbddc541';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double? latitute;
  double? longitude;

  @override
  void initState() {
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitute = location.latitude;

    final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitute&lon=$longitude&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(apiUrl);

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
