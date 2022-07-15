import 'package:flutter/material.dart';
import 'package:quizz_game/src/presentation/Widgets/bootstrap.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/user_repository.dart';

import '../../globalVariables.dart' as globals;



class LoadingAnimation extends StatefulWidget{
  LoadingAnimationState createState() => LoadingAnimationState();
}
class LoadingAnimationState extends State<LoadingAnimation> with TickerProviderStateMixin{

  final UserRepository? userRepository = UserRepository.getInstance();

  final AuthRepository? authRepository = AuthRepository.getInstance();

  late double dev_width,dev_height ;
  late AnimationController line_controller;
  late Animation<double> line_animation;
  double line_length = 0;
  double logo_vertical_alignment = 0;


  void getAllUsers() async{
    await Future<void> (() async {
      await userRepository?.getAllUser().then((value){
        globals.GlobalVariables.usersList?.addAll(value);
        globals.GlobalVariables.usersList?.sort((user1, user2) => user2.data().score!.compareTo(user1.data().score!));
      });
    }).then((value){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Bootstrap()),
      );
    });
  }

  void initState(){
    super.initState();
    getAllUsers();
    line_controller = AnimationController(vsync: this, duration: Duration(seconds: 3),);
    line_animation = Tween<double>(begin: 0.1, end: 1).animate(CurvedAnimation(
      parent: line_controller,
      curve: Interval(0, 0.1, curve: Curves.linear),
    ));
    line_controller.addListener(() {
      setState(() {
        line_length = line_animation.value;
      });
    });
    line_controller.forward();


  }
  @override
  void dispose(){
    line_controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    dev_width = MediaQuery.of(context).size.width;
    dev_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: const Center(
                child: Text(
                  "Quizz Game",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 55,
                      color: Colors.white),
                ),
              ),
            ),
            Divider(height: dev_height / 4,color: Colors.transparent,),//IconData(59498, fontFamily: 'MaterialIcons'),
            Container(
              height: dev_height / 2.7,
              width: 3 * dev_width / 4,
              alignment: Alignment(-1,0),
              child: Container(
                width: line_length * dev_width,
                height: dev_height / 300,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

}