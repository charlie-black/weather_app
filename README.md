# weather_app
This a simple weather app that shows the weather forecast of different locations in the world.

# Brief Description
The user types the city of his or her choice and search is made from the weather api endpoint

Here is a demo of how the app works

[![Demo link](https://img.youtube.com/vi/https://www.youtube.com/watch?v=A2mHEfZTvZ8/0.jpg)](https://www.youtube.com/watch?v=A2mHEfZTvZ8)



## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/charlie-black/weather_app
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```


## App Features:

* Splash
* Homepage
* Weather details page
* Routing
* Theme
* http
* Provider (State Management)
* Validation
* Code Generation
* Dependency Injection
* Provider example (new)


### Libraries & Tools Used

* [http](https://pub.dev/packages/http)
* [fluttertoast](https://pub.dev/packages/fluttertoast)
* [flutter_spinkit](https://pub.dev/packages/flutter_spinkitt) (For a stylish loading animation)

### Folder Structure
Here is the core folder structure which flutter provides.

```
weather_app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- models/
    - results_model.dart
|- screens/
    - homepage.dart
    - weatherdetails.dart
|- utils/
    - constants.dart
    - widgets.dart
|- main.dart
|- splash.dart
```

```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
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
```


## Conclusion

 Feel free to submit an issue and/or pull request 🙂

.


