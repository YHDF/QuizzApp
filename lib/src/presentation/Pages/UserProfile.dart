import 'package:flutter/material.dart';
import 'package:quizz_dezz_nutzz/src/presentation/Widgets/BackgroundClipper.dart';
import '../../domain/User.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  final User user = const User(userId: 1,
      imagePath: "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
      name: 'Sarah Abs',
      email: 'sarah.abs@gmail.com',
      token: '');

  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Stack(
      children: [

        Container(
          color: Colors.blueAccent,
          child: Column(
            children: [
              Divider(height: dev_height / 14, color: Colors.transparent),
              /*SizedBox(
                width: dev_width,
                height: dev_height / 5,
                child: Center(
                  child: Container(
                    width: dev_height > dev_width
                        ? dev_width / 3
                        : dev_height / 3,
                    height: dev_height > dev_width
                        ? dev_width / 2.9
                        : dev_height / 3,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white, width: 1.0),
                      borderRadius:
                      BorderRadius.circular(dev_width / 3),
                    ),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(dev_width),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: dev_height > dev_width
                                ? dev_width / 3
                                : dev_height / 3,
                            height: dev_height > dev_width
                                ? dev_width / 2.9
                                : dev_height / 3,
                            child: Image.network(
                              user.imagePath,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: dev_height > dev_width
                                ? dev_width / 3
                                : dev_height / 3,
                            height: dev_height > dev_width
                                ? dev_width / 2.9
                                : dev_height / 3,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),*/
              Divider(height: dev_height / 50, color: Colors.transparent),

              /*Container(
                width: 9 * dev_width / 10,
                height: dev_height / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Divider(height: dev_height / 50, color: Colors.transparent),
                    Container(
                      height: dev_height / 8,
                      child: Row(
                        children: [
                          VerticalDivider(width: 50, color: Colors.transparent,),
                          Container(
                            width: dev_width / 3,
                            child: const Text(
                              "Pseudo :",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            width: dev_width / 3,
                            child: Center(
                              child: Container(
                                width: 200,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child: Center(
                                  child:  Text(
                                    user.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
        ClipPath(
          clipper: BackgroundClipper(),
          child: Container(
              alignment: Alignment(0, -0.8),
              color: Color.fromRGBO(255, 255, 255, 1),
              child : Container(
                alignment: Alignment(0,-0.8),
                width: dev_width * 0.95 ,
                height: dev_height / 1.2,
                child: Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withOpacity(1),
                      fontWeight: FontWeight.w200, fontSize: dev_height > dev_width ? dev_height/15.64 : dev_width/ 15.64),
                ),
              )
          ),
        ),

      ],
    );

  }
}