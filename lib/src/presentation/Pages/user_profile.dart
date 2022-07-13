import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizz_game/src/data/DataSource/remote/auth_firebase.dart';
import 'package:quizz_game/src/data/DataSource/remote/user_firebase.dart';
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/data/repositories/user_repository.dart';
import 'package:quizz_game/src/presentation/Widgets/background_clipper.dart';
import 'package:quizz_game/src/presentation/Widgets/carte_profile.dart';
import '../../data/entities/user.dart';
enum ImageSourceType { gallery, camera }
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var _image;
  var imagePicker;
  var type;


  final UserRepository? userRepository = UserRepository.getInstance();
  final AuthRepository? authRepository = AuthRepository.getInstance();
  final UserFireBase? userFireBase = UserFireBase.getInstance();

int v = 0;

  TriviaUser? user = TriviaUser();

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    checkUser();
    image();
  }

  void checkUser() async{
      String? email =  authRepository?.getUser();
      await userRepository?.getUserByEmail(email).then((value) => setState((){
        user = value;
      }));
  }

  void image() async {
     _image = "https://picsum.photos/200/300";
     await userRepository?.fetchAvatar().then((value) => setState(() {
       _image = value;
     }));
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
          color: Colors.blueAccent,
          alignment: const Alignment(0, 0.5),
          child: SizedBox(
            width: dev_width,
            height: dev_height / 2,
            child: Column(
              children: [
                Container(
                  width: dev_width,
                  height: dev_height / 3,
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                        width: 2 * dev_width / 3,
                        height: 2 * dev_width / 3,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dev_width * 100),
                            color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 2 * dev_width / 3,
                              height: dev_width / 3 - 25,
                              child: Column(
                                children: const [
                                  Divider(
                                    height: 30,
                                    color: Colors.transparent,
                                  ),
                                  Text(
                                    "22",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w100,
                                        fontSize: 50,
                                        color: Colors.blueAccent),
                                  ),
                                  Text(
                                    "Games Played",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 50,
                              color: Colors.blueAccent,
                              indent: 25,
                              endIndent: 25,
                              thickness: 1.5,
                            ),
                            SizedBox(
                              width: 2 * dev_width / 3,
                              height: dev_width / 3 - 25,
                              child: Column(
                                children: const [
                                  Text(
                                    "9.8",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w100,
                                        fontSize: 50,
                                        color: Colors.blueAccent),
                                  ),
                                  Text(
                                    "Today's score",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const Divider(
                  height: 10,
                  color: Colors.transparent,
                ),
                CarteProfile("Settings", IconData(0xe328, fontFamily: 'MaterialIcons'), "settings"),
                const Divider(
                  height: 10,
                  color: Colors.transparent,
                ),
                CarteProfile("Disconnect", IconData(0xe3b3, fontFamily: 'MaterialIcons'), "logout"),
              ],
            ),
          ),
        ),
        SizedBox(
          width: dev_width,
          height: dev_height / 3,
          child: ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              alignment: const Alignment(0, -0.8),
              color: Color.fromRGBO(255, 255, 255, 1),
              child: SizedBox(
                width: dev_width,
                height: dev_height / 5,
                child: Row(
                  children: [
                    Container(
                      width: dev_width / 3,
                      alignment: Alignment(0, 0.5),
                      child: Container(
                        width: dev_height > dev_width
                            ? dev_width / 4
                            : dev_height / 4,
                        height: dev_height > dev_width
                            ? dev_width / 4
                            : dev_height / 4,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 1.0),
                          borderRadius: BorderRadius.circular(dev_width / 3),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(dev_width),
                          child: Stack(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  var source = type == ImageSourceType.camera
                                      ? ImageSource.camera
                                      : ImageSource.gallery;
                                  XFile image = await imagePicker.pickImage(
                                      source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
                                  await userRepository?.uploadAvatar(image, null).then((value){
                                    _image = value;
                                    setState(() {
                                      // _image = File(image.path);
                                    });
                                  });
                                },
                                child: Container(
                                  width: dev_height > dev_width
                                      ? dev_width / 4
                                      : dev_height / 4,
                                  height: dev_height > dev_width
                                      ? dev_width / 4
                                      : dev_height / 4,
                                  child: Image.network(_image, fit: BoxFit.fill),
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
                    SizedBox(
                      width: 2 * dev_width / 3,
                      child: Column(
                        children: [
                          Divider(
                              height: dev_height / 12,
                              color: Colors.transparent),
                          SizedBox(
                            width: 2 * dev_width / 3,
                            child: Center(
                              child: Text(
                                user?.pseudo ?? "",
                                style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2 * dev_width / 3,
                            child:  Center(
                              child: Text(
                                user?.email ?? "",
                                style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w200,
                                    fontSize: 15,
                                    color: Colors.black),
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
          ),
        ),
        Align(
          alignment: Alignment(1, 0.99),
          child: Container(
            width: dev_width / 6,
            height: dev_width / 6,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(dev_width)),
            child: MaterialButton(
              onPressed: () {
                print("pressed");
              },
              child: const Center(
                child: Icon(
                  IconData(
                    0xf67a,
                    fontFamily: 'MaterialIcons',
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
