import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/screens/weatherdetails.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: KDecoration,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Weather Dojo",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: buildTextField(
                    hintText: 'Type a City', controller: _search)),
            InkWell(
                onTap: () {
                  if (_search.text.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WeatherDetails(keyField: _search.text),
                        ));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please Enter a city before proceeding",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Container(child: buildButton(label: 'Search')))
          ],
        )),
      ),
    );
  }
}
