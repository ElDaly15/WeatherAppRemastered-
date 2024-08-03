import 'package:flutter/material.dart';
import 'package:weather_app/core/models/dayModel.dart';

class ContainerForMoreViewDays extends StatelessWidget {
  const ContainerForMoreViewDays({super.key, required this.dayModel});
  final DayModel dayModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 180,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff705BB0),
              Color(0xff4D3C98),
              Color(0xff913EA7),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                dayModel.avgTemp,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 16),
              ),
            ),
            Image.asset(
              dayModel.image,
              scale: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                dayModel.time,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
