import 'package:flutter/material.dart';

import 'package:weather_app/feature/weather_main/presentation/views/widgets/more_weather_details.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/search_menu.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/weather_start_data.dart';

class MainWeather extends StatefulWidget {
  MainWeather({super.key});

  @override
  State<MainWeather> createState() => _MainWeatherState();
}

class _MainWeatherState extends State<MainWeather> {
  final PageController _pageController = PageController(initialPage: 1);
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int newIndex = _pageController.page!.round();
      if (newIndex != _selectedIndex) {
        setState(() {
          _selectedIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      MoreWeatherDetails(),
      WeatherStartData(),
      SearchMenu(pageController: _pageController),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 45),
        iconSize: 33,
        backgroundColor: Color(0xff913EA7),
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
              color: Color(0XFFFFFFFF),
            ),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.white,
            ),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: PageView(
        controller: _pageController,
        children: pages,
      ),
    );
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }
}
