import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/weather_main/data/model/weather_model.dart';
import 'package:weather_app/feature/weather_main/presentation/manager/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/container_of_stack.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/stack_of_data.dart';

class WeatherStartData extends StatelessWidget {
  const WeatherStartData({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
          final weatherModel =
              BlocProvider.of<GetWeatherCubit>(context).weatherModel;
          if (state is GetWeatherInitial) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Text(
                  'Search Now For Country Weather',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          } else if (state is GetWeatherSuccuess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                height > 640
                    ? SafeArea(child: SizedBox())
                    : SizedBox(
                        height: 0,
                      ),
                Image.asset(
                  'assets/images/sunny.png',
                  scale: width * 0.007,
                ),
                Text(
                  '${weatherModel!.avg_temp.toInt()}°C',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.07,
                  ),
                ),
                Text(
                  weatherModel.condition,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.06,
                  ),
                ),
                Spacer(flex: 1),
                const StackOfData(),
              ],
            );
          } else if (state is GetWeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Text(
                  'No Weather Available For This Country',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
