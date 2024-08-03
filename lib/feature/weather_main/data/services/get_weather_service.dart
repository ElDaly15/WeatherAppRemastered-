import 'package:dio/dio.dart';
import 'package:weather_app/feature/weather_main/data/model/weather_model.dart';

class GetWeatherService {
  Future<WeatherModel> getWeather({required String city}) async {
    final dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=ddaad2f7f45c429295385903242904&q=$city&days=7&aqi=no&alerts=no');
    print(response.data);
    return WeatherModel.jsonData(response.data);
  }
}
