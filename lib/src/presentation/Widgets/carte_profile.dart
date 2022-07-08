import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/main.dart';
import 'package:quizz_game/src/presentation/Pages/initial_page.dart';
import 'package:quizz_game/src/presentation/Pages/signin.dart';



class CarteProfile extends StatelessWidget {

  CarteProfile(this.text, this.iconData, [this.action]);

  final String text;
  final IconData iconData;
  final String? action;
  final AuthRepository? authRepository = AuthRepository.getInstance();

  void actionSelected(String? action, BuildContext context) {
    switch(action) {
      case "settings" : {
        print("settings clicked");
      }
      break;
      case "logout" : {
        authRepository!.signOut();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InitialPage()));
      }
      break;
      default: {}
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        actionSelected(action, context);
      },
      child: Container(
        width: 4 * dev_width / 5,
        height: 60,
        decoration: BoxDecoration(
          color: action == "logout" ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(dev_width / 3),
        ),
        child: Center(
          child: Text(
             text,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: action == "logout" ? Colors.white : Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
