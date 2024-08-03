import 'package:flutter/material.dart';
import 'package:weather_app/feature/start/presentation/views/widgets/main_start_view_opening.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              Color(0xff913EA7)
            ],
          ),
        ),
        child: const MainStartViewOpening(),
      ),
    );
  }
}
