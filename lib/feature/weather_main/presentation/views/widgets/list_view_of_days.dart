import 'package:flutter/material.dart';
import 'package:weather_app/core/models/dayModel.dart';
import 'package:weather_app/feature/weather_main/presentation/views/widgets/container_of_days.dart';

class ListViewOfContainerDays extends StatefulWidget {
  ListViewOfContainerDays(
      {super.key,
      required this.day1,
      required this.day2,
      required this.day3,
      required this.day4,
      required this.day5,
      required this.day6,
      required this.day7});

  final num day1, day2, day3, day4, day5, day6, day7;

  @override
  State<ListViewOfContainerDays> createState() =>
      _ListViewOfContainerDaysState();
}

class _ListViewOfContainerDaysState extends State<ListViewOfContainerDays> {
  late List<DayModel> listOfDays;

  @override
  void initState() {
    super.initState();
    listOfDays = [
      DayModel(
          avgTemp: '${widget.day1}°C',
          image: 'assets/images/sunny.png',
          time: 'Sun'),
      DayModel(
          avgTemp: '${widget.day2}°C',
          image: 'assets/images/sunny.png',
          time: 'Mon'),
      DayModel(
          avgTemp: '${widget.day3}°C',
          image: 'assets/images/sunny.png',
          time: 'Tue'),
      DayModel(
          avgTemp: '${widget.day4}°C',
          image: 'assets/images/sunny.png',
          time: 'Wed'),
      DayModel(
          avgTemp: '${widget.day5}°C',
          image: 'assets/images/sunny.png',
          time: 'Thu'),
      DayModel(
          avgTemp: '${widget.day6}°C',
          image: 'assets/images/sunny.png',
          time: 'Fri'),
      DayModel(
          avgTemp: '${widget.day7}°C',
          image: 'assets/images/sunny.png',
          time: 'Sat'),
    ];
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 100, // Adjust this value for scroll amount
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100, // Adjust this value for scroll amount
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _scrollLeft,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 180,
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: listOfDays.length,
                itemBuilder: (context, index) {
                  return ContainerForMoreViewDays(dayModel: listOfDays[index]);
                }),
          ),
        ),
        IconButton(
          onPressed: _scrollRight,
          icon: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
