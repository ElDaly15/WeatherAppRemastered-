part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

final class GetWeatherSuccuess extends GetWeatherState {}

final class GetWeatherFailuer extends GetWeatherState {}

final class GetWeatherLoading extends GetWeatherState {}
