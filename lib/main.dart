import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/start/presentation/views/start_view.dart';
import 'package:weather_app/feature/weather_main/presentation/manager/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const StartView(),
      ),
    );
  }
}
