import 'dart:convert';

class WeatherModel {
  final String cityName;
  final num min_temp;
  final num max_temp;
  final num avg_temp;
  final num pressure;
  final num wind_degree;
  final String condition;
  final num temp1;
  final num temp2;
  final num temp3;
  final num temp4;
  final num tempDay1;
  final num tempDay2;
  final num tempDay3;

  WeatherModel(
      {required this.cityName,
      required this.min_temp,
      required this.max_temp,
      required this.avg_temp,
      required this.pressure,
      required this.wind_degree,
      required this.condition,
      required this.temp1,
      required this.temp2,
      required this.temp3,
      required this.temp4,
      required this.tempDay1,
      required this.tempDay2,
      required this.tempDay3});

  factory WeatherModel.jsonData(jsonData) {
    return WeatherModel(
        cityName: jsonData["location"]["name"],
        min_temp: jsonData["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        max_temp: jsonData["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        avg_temp: jsonData['current']["temp_c"],
        pressure: jsonData['current']['pressure_mb'],
        wind_degree: jsonData['current']['wind_degree'],
        condition: jsonData['current']["condition"]['text'],
        temp1: jsonData["forecast"]["forecastday"][0]["hour"][0]['temp_c'],
        temp2: jsonData["forecast"]["forecastday"][0]["hour"][1]['temp_c'],
        temp3: jsonData["forecast"]["forecastday"][0]["hour"][2]['temp_c'],
        temp4: jsonData["forecast"]["forecastday"][0]["hour"][3]['temp_c'],
        tempDay1: jsonData["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        tempDay2: jsonData["forecast"]["forecastday"][1]["day"]["avgtemp_c"],
        tempDay3: jsonData["forecast"]["forecastday"][2]["day"]["avgtemp_c"]);
  }
}
