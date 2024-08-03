import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFieldForAppBar extends StatelessWidget {
  CustomTextFieldForAppBar({super.key, required this.onFieldSubmitted});
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: TextFormField(
        onChanged: onFieldSubmitted,
        validator: (value) {
          if (value!.isEmpty || value == null) {
            return 'Please Enter The City Name';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 15,
            color: Color.fromARGB(255, 166, 167, 173),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
                  color: Colors.white, fontFamily: 'Poppins', fontSize: 18)
              .copyWith(color: Color.fromARGB(255, 166, 167, 173)),
          filled: true,
          fillColor: Color(0xffF5F6FA),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
