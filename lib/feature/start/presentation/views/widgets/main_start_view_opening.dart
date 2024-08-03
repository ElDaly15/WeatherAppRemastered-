import 'package:flutter/material.dart';
import 'package:weather_app/feature/weather_main/presentation/views/main_weather.dart';

class MainStartViewOpening extends StatelessWidget {
  const MainStartViewOpening({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Define responsive dimensions
    final double imageSize = screenWidth * 0.5; // 50% of screen width
    final double textSize = screenWidth * 0.12; // 12% of screen width for text
    final double buttonWidth =
        screenWidth * 0.6; // 60% of screen width for button

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeight * 0.1, // 10% of screen height for spacing
        ),
        Image.asset(
          'assets/images/sunny.png',
          height: imageSize,
          width: imageSize,
          fit: BoxFit.cover,
        ),
        Spacer(flex: 1),
        Text(
          'Weather',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: textSize,
          ),
        ),
        Text(
          'ForeCasts',
          style: TextStyle(
            color: Color(0xffDDB130),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: textSize,
          ),
        ),
        Spacer(flex: 1),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(buttonWidth, 50),
            backgroundColor: const Color(0xffDDB130),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MainWeather();
                },
              ),
            );
          },
          child: const Text(
            'Get Start',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color(0xff1F2549),
            ),
          ),
        ),
        Spacer(flex: 3),
      ],
    );
  }
}
