import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 120,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle =
    TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB', color: Colors.black,);

const kConditionTextStyle = TextStyle(
  fontSize: 18
);
var kDegreeTextStyle = TextStyle(
  color: Colors.white.withOpacity(0.5),
  fontWeight: FontWeight.w300,
  fontSize: 70,
);

const kInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
);
