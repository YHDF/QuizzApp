import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int homeButtonColor = 0;
  int statsButtonColor = 125;
  int profileButtonColor = 125;

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
      height: dev_height / 12,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Row(
        children: [
          const VerticalDivider(
            width: 35,
            color: Colors.transparent,
          ),
          Container(
            width: dev_width / 4,
            height: double.infinity,
            child: TextButton(
              child: Icon(
                const IconData(0xe328, fontFamily: 'MaterialIcons'),
                size: 35,
                color: Color.fromRGBO(homeButtonColor, homeButtonColor, homeButtonColor, 1),
              ),
              onPressed: () {
                setState((){
                  homeButtonColor = 0;
                  statsButtonColor = profileButtonColor = 125;
                });
              },
            ),
          ),
          const VerticalDivider(
            width: 20,
            color: Colors.transparent,
          ),
          Container(
            width: dev_width / 4,
            height: double.infinity,
            child: TextButton(
              child: Icon(
                const IconData(0xe36f, fontFamily: 'MaterialIcons'),
                size: 35,
                color: Color.fromRGBO(statsButtonColor, statsButtonColor, statsButtonColor, 1),
              ),
              onPressed: () {
                setState((){
                  statsButtonColor = 0;
                  homeButtonColor = profileButtonColor = 125;
                });
              },
            ),
          ),
          const VerticalDivider(
            width: 20,
            color: Colors.transparent,
          ),
          Container(
            width: dev_width / 4,
            height: double.infinity,
            child: TextButton(
              child: Icon(
                const IconData(0xe491, fontFamily: 'MaterialIcons'),
                size: 35,
                color: Color.fromRGBO(profileButtonColor, profileButtonColor, profileButtonColor, 1),
              ),
              onPressed: () {
                setState((){
                  profileButtonColor = 0;
                  statsButtonColor = homeButtonColor = 125;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
