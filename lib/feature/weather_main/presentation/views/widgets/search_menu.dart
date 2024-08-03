import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/weather_main/presentation/manager/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/feature/weather_main/presentation/views/main_weather.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/text_field.dart';

class SearchMenu extends StatefulWidget {
  final PageController pageController;

  SearchMenu({super.key, required this.pageController});

  @override
  State<SearchMenu> createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  final formKey = GlobalKey<FormState>();
  String? city;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          children: [
            SafeArea(
              child: SizedBox(height: 10),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextFieldForAppBar(
                onFieldSubmitted: (value) {
                  city = value;
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(160, 40),
                backgroundColor: const Color(0xffDDB130),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<GetWeatherCubit>(context)
                      .getWeather(city: city);
                  widget.pageController.jumpToPage(1);
                }
              },
              child: const Text(
                'Search',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xff1F2549),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
