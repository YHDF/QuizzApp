import 'package:flutter/material.dart';
import 'package:quizz_dezz_nutzz/src/presentation/Widgets/Carte.dart';
import 'package:quizz_dezz_nutzz/src/presentation/Widgets/Carte.dart';

class Classement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClassementState();
}

class ClassementState extends State<Classement> {
  var cartesClassement = List<Carte>.generate(10, (index) {
    return new Carte();
  });

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
      color: Colors.blueAccent,
      child: Column(
        children: [
          Divider(
            height: dev_height / 20,

          ),
          SizedBox(
            height: dev_height / 25,
            child: const Text(
              "Liste des top joueurs : ",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25, color: Colors.white),
            ),
          ),
          Container(
            height: 10 * dev_height / 12,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 10,
                      color: Colors.transparent,

                    ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Carte();
                }),
          ),
        ],
      ),
    );
  }
}
