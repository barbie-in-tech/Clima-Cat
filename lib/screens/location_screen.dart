import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  var temperature;
  String cityName;
  String weatherIcon;
  String weatherText;
  var feelsLikeInInt;
  var minTemperature;
  var maxTemperature;
  var dt;
  var newFormat;
  String updatedDt;
  String getImage;
  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;

        weatherIcon = 'Error';
        weatherText = 'Unable to get location';
        cityName = '';
        return;
      }
      var minTemp = weatherData['main']['temp_min'];
      minTemperature = minTemp.toInt();

      var maxTemp = weatherData['main']['temp_max'];
      maxTemperature = maxTemp.toInt();

      var feelsLike = weatherData['main']['feels_like'];
      feelsLikeInInt = feelsLike.toInt();

      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      var condition = weatherData['weather'][0]['id'];

      weatherIcon = weather.getWeatherIcon(condition);

      weatherText = weather.getMessage(temperature);

      cityName = weatherData['name'];

      dt = DateTime.now();
      newFormat = DateFormat("EEEE");
      updatedDt = newFormat.format(dt);

      getImage = weather.getWeatherImage(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xff000000),
//          decoration: BoxDecoration(
//              gradient: LinearGradient(
//                  begin: Alignment.topCenter,
//                  end: Alignment.bottomCenter,
//                  colors: ([
//                    Color(0xff434343),
//                    Color(0xff000000),
//                    //100 Vicious StanceGet .PNG#29323c→#485563
//                  ]))),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(
                          weatherData); // update the weather with change in current location of the user
                    },
                    child: Icon(
                      Icons.location_on,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                  Text('clima'),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.search,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.83,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
//            backgroundBlendMode: BlendMode.darken,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: ([
                        Color(0xffc9518f),
//                        Color(0xffd15e9a),
                        Color(0xffdf89b5),
                        Color(0xffe6a3c4),
                        Color(0xffe0c3fc),
                        Color(0xffbfd9fe),
                        Color(0xffa9ccfc),
                        Color(0xff8ec5fc),
//                        Color(0xff6ab0f7),
                        Color(0xff56a5f5)
                      ])),
                  //024 Near MoonGet .PNG#5ee7df→#b490ca
                  borderRadius: BorderRadius.circular(30.0),
                ),
//              height: MediaQuery.of(context).size.height * 0.8,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '$temperature°',
                                style: kTempTextStyle,
                              ),
                              Text(
                                'Feels like $feelsLikeInInt°',
                                style: kLowerText,
                              ),
                              Text(
                                '▼$minTemperature° ▲$maxTemperature°',
                                style: kLowerText,
                              ),
                            ],
                          ),
//                          SizedBox(
//                            width: MediaQuery.of(context).size.width * 0.3,
//                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                weatherIcon,
                                style: kConditionTextStyle,
                              ),
                              Text(
                                updatedDt,
                                style: kLowerText,
                              ),
                              Text(
                                cityName,
                                textAlign: TextAlign.right,
                                style: kLowerText,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      Image(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.7,
                        image: AssetImage(getImage),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Text(
                        weatherText,
                        textAlign: TextAlign.center,
                        style: kMessageTextStyle,
                      ),
//                      SizedBox(
//                        height: MediaQuery.of(context).size.height * 0.001,
//                      ),
//                    Text('Illustrations © Tanvi Kohli'),
//                    Text('@art_vistaaaa'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.007,
              ),
              Text(
                'Illustrations © Tanvi Kohli',
                style: TextStyle(color: Colors.white54, fontSize: 10.0),
              ),
              Text(
                '@art_vistaaaa',
                style: TextStyle(color: Colors.white54, fontSize: 10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//FlatButton(
//onPressed: () async {
//var weatherData = await weather.getLocationWeather();
//updateUI(
//    weatherData); // update the weather with change in current location of the user
//},
//child: Icon(
//Icons.location_on,
//size: 50.0,
//),
//),

//        appBar: AppBar(
//          actions: <Widget>[
//            Padding(
//              padding: EdgeInsets.only(right: 20.0),
//              child: GestureDetector(
//                onTap: () async {
//                  var typedName = await Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) {
//                        return CityScreen();
//                      },
//                    ),
//                  );
//                  if (typedName != null) {
//                    var weatherData = await weather.getCityWeather(typedName);
//                    updateUI(weatherData);
//                  }
//                },
//                child: Icon(
//                  Icons.search,
//                  size: 30.0,
//                ),
//              ),
//            ),
//          ],
//        ),
