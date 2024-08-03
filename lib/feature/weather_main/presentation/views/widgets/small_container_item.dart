import 'package:flutter/material.dart';

class SmallContainerItem extends StatelessWidget {
  const SmallContainerItem({super.key, required this.temp, required this.time});

  final num temp;
  final String time;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale =
        (width + height) / 2; // Averaged scale based on screen dimensions

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.014, // Adjusted vertical padding
      ),
      child: Column(
        children: [
          Text(
            '${temp}°C',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: textScale *
                  0.025, // Adjusted text size based on average scale
            ),
          ),
          Image.asset(
            'assets/images/sunny.png',
            scale: height < 700 ? textScale * 0.016 : textScale * 0.01,
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: textScale *
                  0.025, // Adjusted text size based on average scale
            ),
          ),
        ],
      ),
    );
  }
}
