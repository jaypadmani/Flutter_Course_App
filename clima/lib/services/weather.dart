import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '6f7cdcf7f1229a99981d45051b523a29';


class WeatherModel {

  Future<dynamic> getSelectedCityLocation(String cityname) async{
    var url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric';
    NetworkHandler networkHandler = NetworkHandler(url);

    var whetherdata = await networkHandler.getData();
    return whetherdata;
  }

  Future<dynamic> getwheatherLocation() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHandler networkHandler = NetworkHandler(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude1}&lon=${location.longitude1}&appid=$apikey&units=metric');

    var whetherData = await networkHandler.getData();

    return whetherData;
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
}
