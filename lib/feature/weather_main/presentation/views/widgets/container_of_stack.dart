import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/weather_main/data/model/weather_model.dart';
import 'package:weather_app/feature/weather_main/presentation/manager/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/small_container_item.dart';

class ContainerOfStack extends StatelessWidget {
  const ContainerOfStack({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff3E2C8F),
            Color(0xff543697),
            Color(0xff6A409E),
            Color(0xff814BA5),
            Color(0xff934FAB),
          ],
        ),
      ),
      height: height * 0.28, // Responsive height
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.08,
              vertical: height * 0.02,
            ),
            child: Row(
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: width * 0.04, // Responsive text size
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  'July, 21',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: width * 0.04, // Responsive text size
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 0.6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallContainerItem(
                temp: weatherModel!.temp1.toInt(),
                time: '1:00',
              ),
              SmallContainerItem(
                temp: weatherModel.temp2.toInt(),
                time: '2:00',
              ),
              SmallContainerItem(
                temp: weatherModel.temp3.toInt(),
                time: '3:00',
              ),
              SmallContainerItem(
                temp: weatherModel.temp4.toInt(),
                time: '4:00',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
