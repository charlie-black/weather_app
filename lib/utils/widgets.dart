import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

Widget buildHomePageCards(
    {required String title, required String data, required String iconData}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(
        gradient: kPrimaryGradient,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      height: 150,
      width: 110,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              iconData,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data),
          ),
        ],
      )),
    ),
  );
}

Widget buildCountryText({required String city, required String country}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(city,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(country,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      )
    ],
  );
}

Widget buildTextField({
  required String hintText,
  required TextEditingController controller,
}) {
  return FractionallySizedBox(
    widthFactor: 1,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 60,
          color: Colors.transparent,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kGrayColor),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kGrayColor),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: kGrayColor),
            ),
            style: const TextStyle(color: kGrayColor),
          )),
    ),
  );
}

Widget buildButton({required String label}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 200,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(kDefaultPadding * 0.75),
      decoration: const BoxDecoration(
        gradient: kPrimaryGradient,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(label,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold)),
    ),
  );
}
