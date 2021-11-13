import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/results_model.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/key.dart';
import 'package:weather_app/utils/widgets.dart';

class WeatherDetails extends StatefulWidget {
  final String keyField;
  const WeatherDetails({Key? key, required this.keyField}) : super(key: key);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  Future<Results> displayWeather() async {
    var headers = {'content-type': 'application/json'};

    var response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=${widget.keyField}&APPID=$ApiKey"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var info = json.decode(response.body);
      var weather = Results.fromJson(info);
      return weather;
    } else {
      throw Exception('No locations found with the name ${widget.keyField} 😕');
    }
  }

  @override
  void initState() {
    super.initState();

    displayWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<Results>(
              future: displayWeather(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Results? weatherResults = snapshot.data;

                  return Container(
                    decoration: KDecoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildCountryText(
                            city: weatherResults!.name,
                            country: weatherResults.sys.country),
                        Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              'http://openweathermap.org/img/w/${weatherResults.weather[0].icon}.png',
                              fit: BoxFit.cover,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(weatherResults.weather[0].description,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildHomePageCards(
                                title: 'Temperature',
                                iconData: 'assets/temp.png',
                                data:
                                    weatherResults.main.temp.toString() + '°F'),
                            buildHomePageCards(
                                title: 'Pressure',
                                iconData: 'assets/pressure.png',
                                data: weatherResults.main.pressure.toString() +
                                    ' pa'),
                            buildHomePageCards(
                                title: 'Humidity',
                                iconData: 'assets/humidity.png',
                                data: weatherResults.main.humidity.toString() +
                                    ' g.kg-1'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildHomePageCards(
                                title: 'Sunrise',
                                iconData: "assets/sunrise.png",
                                data: weatherResults.sys.sunrise.toString()),
                            buildHomePageCards(
                                title: 'Sunset',
                                iconData: 'assets/sunset.png',
                                data: weatherResults.sys.sunset.toString()),
                            buildHomePageCards(
                                title: 'Visibility',
                                iconData: 'assets/visibility.png',
                                data: weatherResults.visibility.toString()),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    decoration: KDecoration,
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('${snapshot.error}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ),
                  );
                }
                return Container(
                  decoration: KDecoration,
                  child: SpinKitWanderingCubes(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? const Color(0xFF46A0AE)
                              : const Color(0xFF00FFCB),
                        ),
                      );
                    },
                  ),
                );
                ;
              })),
      backgroundColor: Colors.black,
    );
  }
}
