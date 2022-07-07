import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class CarteProfile extends StatelessWidget {

  CarteProfile(this.text, this.iconData);

  final String text;
 final  IconData iconData;

  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Container(
      width: 4 * dev_width / 5,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(dev_width / 3),
      ),
      child: Center(
        child: Text(
           text,
          style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.black),
        ),
      ),
    );
  }
}
