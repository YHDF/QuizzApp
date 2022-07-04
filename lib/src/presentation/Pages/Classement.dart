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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1, -1),
          end: Alignment(1, 1),
          colors: [
            Color(0xFF5b86e5),
            Color(0xFF9baefa),
          ],
        ),
      ),
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: 10,
                color: Colors.white,
                indent: dev_height > dev_width
                    ? dev_width / 16.48
                    : dev_height / 16.48,
                endIndent: dev_height > dev_width
                    ? dev_width / 16.48
                    : dev_height / 16.48,
              ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Carte();
          }),
    );
  }
}
