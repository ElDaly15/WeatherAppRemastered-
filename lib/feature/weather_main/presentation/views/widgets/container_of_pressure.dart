import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerOfPressure extends StatelessWidget {
  const ContainerOfPressure({super.key, required this.pressure});

  final num pressure;

  @override
  Widget build(BuildContext context) {
    // Get the screen width for responsive design
    final double screenWidth = MediaQuery.of(context).size.width;
    // Set the container width based on screen width
    final double containerWidth = screenWidth * 0.4; // 40% of screen width
    final double containerHeight = containerWidth; // Keeping it square
    final double textSize = containerWidth * 0.12; // Responsive text size

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 8,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff3E2D8F),
              Color(0xff603F9D),
              Color(0xff66449F),
              Color(0xff764DA7),
              Color(0xff913EA7),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: Icon(
                FontAwesomeIcons
                    .cloudMeatball, // Changed to a more relevant icon
                color: Colors.white,
                size: textSize * 0.8, // Responsive icon size
              ),
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Pressure',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: textSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              '${pressure.toInt()} hPa', // Added unit for clarity
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: textSize * 1.2, // Slightly larger for emphasis
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
