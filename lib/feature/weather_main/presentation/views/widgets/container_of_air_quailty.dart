import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerOfAirQuailty extends StatelessWidget {
  const ContainerOfAirQuailty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
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
              Color(0xff503494),
              Color(0xff623B9A),
              Color(0xff8749A5),
              Color(0xff913EA7)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                FontAwesomeIcons.crosshairs,
                color: Colors.white,
              ),
              title: Text(
                'Air Quailty',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 8),
              child: Text(
                '3-Low Health Risk',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Divider(
              endIndent: 40,
              thickness: 2,
              indent: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 16, left: 16, bottom: 8, top: 8),
                  child: Text(
                    'See More',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 16, left: 16, bottom: 8, top: 8),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
