class Weather {
  final String main;
  final String description;
  final String icon;

  Weather({required this.main, required this.description, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}

class Main {
  final double temp;
  final double pressure;
  final int humidity;

  Main({
    required this.temp,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: double.parse(json['temp'].toString()),
        pressure: double.parse(json['pressure'].toString()),
        humidity: json['humidity']);
  }
}

class Sys {

  final String country;
  final int sunrise;
  final int sunset;

  Sys(
      {
      required this.country,
      required this.sunrise,
      required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(

        country: json['country'],
        sunset: json['sunset'],
        sunrise: json['sunrise']);
  }
}

class Results {
  final List<Weather> weather;

  final Main main;
  final int visibility;
  final Sys sys;

  final String name;

  Results({
    required this.weather,
    required this.main,
    required this.sys,
    required this.name,
    required this.visibility,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      weather: (json['weather'] as List)
          .map((item) => Weather.fromJson(item))
          .toList(),
      main: Main.fromJson(json['main']),
      visibility: json['visibility'],
      sys: Sys.fromJson(json['sys']),
      name: json['name'],
    );
  }
}
