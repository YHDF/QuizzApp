import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizz_game/src/presentation/Widgets/carte_verticale.dart';

import '../../data/entities/user.dart';
import '../../globalVariables.dart' as globals;


class Classement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClassementState();
}

class ClassementState extends State<Classement> {




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
                itemCount: globals.GlobalVariables.usersList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return CarteVerticale(globals.GlobalVariables.usersList![index].data().pseudo!, globals.GlobalVariables.usersList![index].data().score!);
                }),
          ),
        ],
      ),
    );
  }
}
