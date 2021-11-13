import 'package:flutter/material.dart';

const fPrimaryColor = Color(0xFF4a4bf6);
const kGreenColor = Color(0xFF6AC259);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
// ignore: constant_identifier_names
const KDecoration =  BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/bg3.jpg"),
        fit: BoxFit.fill));
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
const double kDefaultPadding = 20.0;
const double kDefaultWidth = 20.0;