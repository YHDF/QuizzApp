import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/main.dart';
import 'package:quizz_game/src/presentation/Pages/home.dart';
import 'package:quizz_game/src/presentation/Pages/initial_page.dart';
import 'package:quizz_game/src/presentation/Pages/signin.dart';
import 'package:quizz_game/src/presentation/Widgets/bootstrap.dart';



class ScorePage extends StatelessWidget {

  ScorePage(this.score);

  final String score;



  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Quizz", style:  TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Bootstrap()));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        child: Center(
          child: Text(score),
        ),
      ),
    );
  }
}
