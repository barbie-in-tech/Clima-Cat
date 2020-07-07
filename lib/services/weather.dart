import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '07df4b0852c4624f702b9647a8c3dda5';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.lat}&lon=${location.long}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getWeatherImage(int condition) {
    if (condition < 300) {
      return ("images/cloudy.png"); //cloudy
    } else if (condition < 400) {
      return ("images/rainy.png"); //rainy
    } else if (condition < 600) {
      return ("images/rainy.png"); //rainy
    } else if (condition < 700) {
      return ("images/winter.png"); // winter
    } else if (condition < 800) {
      return ("images/cloudy.png"); // cloudy
    } else if (condition == 800) {
      return ("images/sunny.png"); //sunny
    } else if (condition <= 804) {
      return ("images/cloudy.png"); //cloudy
    } else {
      return ("images/sleepy.png"); //sleep
    }
  }
}
