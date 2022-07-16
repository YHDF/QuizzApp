import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/data/repositories/user_repository.dart';
import 'package:quizz_game/src/data/DataSource/remote/user_firebase.dart';
import 'package:quizz_game/src/data/entities/user.dart';
import 'package:quizz_game/src/presentation/Widgets/bootstrap.dart';

class EditPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditPasswordPageState();
}

class EditPasswordPageState extends State<EditPasswordPage> {
  void initState() {
    super.initState();
    checkUser();
  }

  final _formKey = GlobalKey<FormState>();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  final _controllerOldPassword = TextEditingController();
  final _controllerNewPassword = TextEditingController();
  final _controllerNewConfirmPassword = TextEditingController();
  final AuthRepository? authRepository = AuthRepository.getInstance();

  final UserRepository? userRepository = UserRepository.getInstance();
  final UserFireBase? userFireBase = UserFireBase.getInstance();
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  TriviaUser? user = TriviaUser();

  void _handleSubmitted(String value) {
    _focusScopeNode.nextFocus();
  }

  void checkUser() async {
    String? email = authRepository?.getUser();
    await userRepository?.getUserByEmail(email).then((value) => setState(() {
          user = value;
        }));
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
                          "Edit your password",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
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
                        controller: _controllerOldPassword,
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
                            hintText: 'Old password'),
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
                        controller: _controllerNewPassword,
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
                            hintText: 'New password'),
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
                        controller: _controllerNewConfirmPassword,
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
                            hintText: 'Confirm your new password'),
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
                          onPressed: () {
                            if(_controllerNewPassword.text == _controllerNewConfirmPassword.text) {
                              var cred = EmailAuthProvider.credential(
                                  email: user!.email!,
                                  password: _controllerOldPassword.text);
                              _fireBaseAuth.currentUser
                                  ?.reauthenticateWithCredential(cred)
                                  .then((value) {
                                _fireBaseAuth.currentUser
                                    ?.updatePassword(_controllerNewPassword.text)
                                    .then((_) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Bootstrap()));
                                }).catchError((error) {
                                  print("Password can't be changed" +
                                      error.toString());
                                });
                              }).catchError((error) {});
                            }
                          },
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
