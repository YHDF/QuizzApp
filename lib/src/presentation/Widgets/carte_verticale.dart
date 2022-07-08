import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarteVerticale extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CarteVerticaleState();
}

class CarteVerticaleState extends State<CarteVerticale> {
  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        const VerticalDivider(width: 10, color: Colors.transparent,),
        Container(
          width: dev_width / 7,
          height: dev_width / 7,
          color: Colors.blueAccent,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(dev_width / 8),
            ),
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(dev_width),
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: dev_height > dev_width
                        ? dev_width / 4
                        : dev_height / 4,
                    height: dev_height > dev_width
                        ? dev_width / 4
                        : dev_height / 4,
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/User_font_awesome.svg/2048px-User_font_awesome.svg.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: dev_height > dev_width
                        ? dev_width / 4
                        : dev_height / 4,
                    height: dev_height > dev_width
                        ? dev_width / 4
                        : dev_height / 4,
                  )
                ],
              ),
            ),
          ),
        ),
        const VerticalDivider(width: 15, color: Colors.transparent,),

        Container(
          width: 7.5 * dev_width / 10,
          height: dev_height / 11,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [

              const VerticalDivider(width: 10, color: Colors.transparent,),
              SizedBox(
                width: 4 * dev_width / 6 ,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [

                    Text(
                      "Jean Mouloud",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        overflow : TextOverflow.ellipsis,

                      ),
                    ),
                    Divider(height: 100, color: Colors.transparent,),
                    Text(
                      "0.5/10",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(
          height: 10,
          thickness: 0,
          color : Colors.transparent
        ),
      ],
    );
  }
}
