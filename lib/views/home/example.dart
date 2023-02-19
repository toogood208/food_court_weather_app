import 'package:flutter/material.dart';
import 'package:food_court_weather_app/core/services/network_services/network_constant.dart';
import 'package:open_weather_api_client/open_weather_api_client.dart';

// This example uses the Current Weather API endpoint
class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              // Setting up the weather factory
              CurrentWeatherFactory factory = CurrentWeatherFactory(
                apiKey: apiKey,
                settings: UnitSettings(
                  windSpeedUnit: WindSpeedUnit.Knots,
                ),
                cityName: "London",
              );

              // Requesting the weather
              RequestResponse<CurrentWeather?> result =
              await factory.getWeather();

              // Checking if the request was successful
              if (result.requestStatus == RequestStatus.Successful) {
                // Printing the city name from the server
                print(result.response!.cityName);
                // Printing the temperature
                print(result.response!.temp);
                // Printing the weather type
                print(result.response!.weatherType);
              } else {
                // Printing the error that occurred
                print("Error of type ${result.requestStatus} occurred");
              }
            },
            child: Container(
              width: 200,
              height: 100,
              alignment: Alignment.center,
              color: Colors.green,
              child: Text(
                "Get Weather at London",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}