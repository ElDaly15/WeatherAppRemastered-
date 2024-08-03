import 'package:flutter/material.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/container_of_stack.dart';

class StackOfData extends StatelessWidget {
  const StackOfData({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        const ContainerOfStack(),
        Positioned(
          right: 0,
          left: 0,
          bottom: height <= 800 ? height * 0.28 : height * 0.261,
          child: Image.asset(
            'assets/images/House.png',
            width: width * 0.8,
            height: height * 0.24, // Adjust width of the image
          ),
        ),
      ],
    );
  }
}
