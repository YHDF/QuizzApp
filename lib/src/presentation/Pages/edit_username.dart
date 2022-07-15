import 'package:flutter/material.dart';
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/data/repositories/user_repository.dart';
import 'package:quizz_game/src/data/DataSource/remote/user_firebase.dart';
import 'package:quizz_game/src/data/entities/user.dart';
import 'package:quizz_game/src/presentation/Pages/edit_password.dart';

class EditUsernamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditUsernamePageState();
}

class EditUsernamePageState extends State<EditUsernamePage> {
  var imagePicker;
  var type;

  final _formKey = GlobalKey<FormState>();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  final _controllerPassword = TextEditingController();
  final _controllerPseudo = TextEditingController();
  final AuthRepository? authRepository = AuthRepository.getInstance();

  final UserRepository? userRepository = UserRepository.getInstance();
  final UserFireBase? userFireBase = UserFireBase.getInstance();

  TriviaUser? user = TriviaUser();

  void _handleSubmitted(String value) {
    _focusScopeNode.nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(height: MediaQuery.of(context).size.height / 8),
            Form(
              key: _formKey,
              child: FocusScope(
                node: _focusScopeNode,
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Edit your username",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            onTap: () {},
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: _handleSubmitted,
                            controller: _controllerPseudo,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Pseudo is required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 0.5),
                                ),
                                hintText: 'Pseudo'),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        obscureText: true,
                        onTap: () {},
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: _handleSubmitted,
                        controller: _controllerPassword,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                            ),
                            hintText: 'Password'),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        obscureText: true,
                        onTap: () {},
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: _handleSubmitted,
                        controller: _controllerPassword,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Confirmation is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                            ),
                            hintText: 'Confirm your password'),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {},
                          color: Colors.blueAccent[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Save",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 90,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Edit your password",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditPasswordPage()));
                          },
                          color: Colors.redAccent[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Edit password",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
