import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarteHorizontale extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CarteHorizontaleState();
}

class CarteHorizontaleState extends State<CarteHorizontale> {
  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: dev_width / 2,
          height: dev_height / 5,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white)
          ),
        ),
        Container(
          width: dev_width / 2,
          height: dev_height / 7,
          decoration: BoxDecoration(
              color: Colors.white ,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white)
          ),
        )

      ],
    );
  }
}
