import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Carte extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CarteState();
}

class CarteState extends State<Carte> {
  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: 9 * dev_width / 10,
          height: dev_height / 9,
          child: Row(
            children: [
              VerticalDivider(width: 10, color: Colors.transparent,),
              Container(
                width: dev_width / 6,
                height: dev_width / 6,
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
                        Container(
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
                        Container(
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
              VerticalDivider(width: 10, color: Colors.transparent,),
              Container(
                width: 4 * dev_width / 6 ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Username : Jean Mouloud",
                      style: TextStyle(
                        color: Color(0xFFFFFF).withOpacity(1),
                        fontSize: 12,
                      ),
                    ),
                    Divider(height: 10,),
                    Text(
                      "Score : 0.5/10",
                      style: TextStyle(
                        color: Color(0xFFFFFF).withOpacity(1),
                        fontSize: 12,
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
