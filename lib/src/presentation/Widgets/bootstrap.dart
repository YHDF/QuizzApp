import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:quizz_game/src/presentation/Pages/classement.dart';
import 'package:quizz_game/src/presentation/Pages/home.dart';
import 'package:quizz_game/src/presentation/Pages/user_profile.dart';


class Bootstrap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BootstrapState();
}

class BootstrapState extends State<Bootstrap> {

  final List<Widget> _tabItems = [Home(), Classement(), UserProfile(),];
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.blueAccent,
        items: const <Widget>[
          Icon(IconData(0xe328, fontFamily: 'MaterialIcons')),
          Icon(IconData(0xe36f, fontFamily: 'MaterialIcons')),
          Icon(IconData(0xe491, fontFamily: 'MaterialIcons'))
        ],
        onTap: (index) {
          setState(() {
            _activePage = index;
          });
        },
      ),
      body: _tabItems[_activePage],
    );
  }
}
