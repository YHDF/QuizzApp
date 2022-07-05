import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_dezz_nutzz/src/main.dart';
import 'package:quizz_dezz_nutzz/src/presentation/Widgets/CarteHorizontale.dart';

import '../../GlobalVariables.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Container(
      width: dev_width,
      height: dev_height,
      color: Colors.blueAccent,
      child: Column(
        children: [
          Divider(height: dev_height / 14, color: Colors.transparent),
          const Center(
            child: Text(
              "Quizz Game",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 55,
                  color: Colors.white),
            ),
          ),
          Divider(height: dev_height / 14, color: Colors.transparent),
          Container(
            width: dev_width,
            height: dev_height / 2.5,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: dev_width / 4,
                      child: Divider(
                        indent: dev_height > dev_width
                            ? dev_width / 19
                            : dev_height / 19,
                        endIndent: dev_height > dev_width
                            ? dev_width / 41.2
                            : dev_height / 41.2,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: dev_width / 2,
                      alignment: Alignment(0, 0),
                      child: Text(
                        'Categories :',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: dev_height > dev_width
                              ? dev_height / 36.8
                              : dev_height / 36.8,
                        ),
                      ),
                    ),
                    Container(
                      width: dev_width / 4,
                      child: Divider(
                        indent: dev_height > dev_width
                            ? dev_width / 19
                            : dev_height / 19,
                        endIndent: dev_height > dev_width
                            ? dev_width / 41.2
                            : dev_height / 41.2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                SizedBox(
                  width: dev_width,
                  height: dev_height / 4,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return index == 0
                          ? Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const VerticalDivider(
                                  width: 20,
                                ),
                                CarteHorizontale(),
                              ],
                            )
                          : CarteHorizontale();
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const VerticalDivider(
                      thickness: 5,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
