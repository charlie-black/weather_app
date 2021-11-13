import 'package:flutter/material.dart';
import 'package:weather_app/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData lightTheme = ThemeData.light().copyWith(
    cardColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  final ThemeData darkTheme = ThemeData.dark().copyWith(
    cardColor: Colors.grey,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.yellow,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
