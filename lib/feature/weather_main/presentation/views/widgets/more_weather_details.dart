import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/models/dayModel.dart';
import 'package:weather_app/feature/weather_main/data/model/weather_model.dart';
import 'package:weather_app/feature/weather_main/presentation/manager/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/container_of_air_quailty.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/container_of_days.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/container_of_max_speed_of_wind.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/container_of_pressure.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/list_view_of_days.dart';

class MoreWeatherDetails extends StatefulWidget {
  const MoreWeatherDetails({Key? key}) : super(key: key);

  @override
  State<MoreWeatherDetails> createState() => _MoreWeatherDetailsState();
}

class _MoreWeatherDetailsState extends State<MoreWeatherDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1F2549),
            Color(0xff353575),
            Color(0xff4D3C98),
            Color(0xff8A47AC),
            Color(0xff913EA7),
          ],
        ),
      ),
      child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          final weatherModel = context.watch<GetWeatherCubit>().weatherModel;

          if (state is GetWeatherInitial) {
            return Center(
              child: Text(
                'Search Now For Country Weather',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          } else if (state is GetWeatherSuccuess && weatherModel != null) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SafeArea(child: SizedBox())),
                SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      weatherModel.cityName,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          'Max: ${weatherModel.max_temp.toInt()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          'Min: ${weatherModel.min_temp.toInt()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      '7-Days Forecasts',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                // Uncomment if ListViewOfContainerDays is used
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: ListViewOfContainerDays(
                      day1: weatherModel.tempDay1.toInt(),
                      day2: weatherModel.tempDay2.toInt(),
                      day3: weatherModel.tempDay3.toInt(),
                      day4: weatherModel.tempDay2.toInt(),
                      day5: weatherModel.tempDay3.toInt(),
                      day6: weatherModel.tempDay1.toInt(),
                      day7: weatherModel.tempDay2.toInt(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: ContainerOfAirQuailty(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContainerOfMaxSpeedOfWind(
                        speed: weatherModel.wind_degree,
                      ),
                      ContainerOfPressure(
                        pressure: weatherModel.pressure,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 32),
                ),
              ],
            );
          } else if (state is GetWeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text(
                'No Weather Available For This Country',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
