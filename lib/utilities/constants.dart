import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kSearchScreenDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  icon: Icon(
    Icons.brightness_low,
    size: 30.0,
    color: Color(0xff08175e),
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Color(0xff08175e),
  ),
  border: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      borderSide: BorderSide.none),
);
