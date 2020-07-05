import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
//            width: MediaQuery.of(context).size.width * 0.5,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(color: Color(0xff08175e), fontSize: 20.0),
                    decoration: kSearchScreenDecoration,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Get Weather',
                        style: kButtonTextStyle,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
