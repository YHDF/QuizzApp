import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_game/src/presentation/Widgets/carte_horizontale.dart';

import '../../globalVariables.dart';

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
    return Stack(
      children: [
        Container(
          width: dev_width,
          height: dev_height,
          color: Colors.white,
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Divider(height: dev_height / 8, color: Colors.transparent,),
                SizedBox(
                  height: dev_height / 8,
                  child: const Center(
                    child: Text(
                      "Quizz Game",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 55,
                          color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: dev_width ,
          height: dev_height,
          alignment: Alignment(-1, 1.6),
          color: Colors.transparent,
          child: Container(
            width: dev_width ,
            height: 2 * dev_height / 3,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Divider(height: dev_height / 14, color: Colors.transparent),
                Container(
                  width: dev_width,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 9 * dev_width / 10,
                        child: Center(
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
                      const Divider(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment(0, 0),
                        width: dev_width / 3,
                        height: dev_height / 12,
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:60,
                          onPressed: (){
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: const Text(
                            "Play",
                            style:
                            TextStyle(
                                fontWeight: FontWeight.w100,fontSize: 20,color: Colors.blueAccent
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
