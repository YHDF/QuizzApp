
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/data/repositories/user_repository.dart';
import 'package:quizz_game/src/presentation/Pages/signup/signupCubit.dart';
import 'package:quizz_game/src/presentation/Pages/signup/signupState.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}
class _SignupPageState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  SignUpCubit? cubit;


  void _handleSubmitted(String value) {
    _focusScopeNode.nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepository>(
            create: (context) => UserRepository.getInstance(),
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository.getInstance(),
          ),
        ],
        child: BlocProvider(
          create: (context) {
            cubit = SignUpCubit(
                userRepository:
                RepositoryProvider.of<UserRepository>(context),
                authRepository:
                RepositoryProvider.of<AuthRepository>(context));
            return cubit!;
          },
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if(state is Error) {
                ScaffoldMessenger
                    .of(context)
                    .showSnackBar(const SnackBar(content: Text('Erreur')))
                    .closed
                    .then((reason) {});
              } else if(state is Loading) {
                setState(() {
                  //displayLoader = true;
                });
              }
            },
            builder: (context, state) {
              if(state is Saved) {
                return Container();
              }
              return SafeArea(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Form(
                      key: _formKey,
                      child: FocusScope(
                        node: _focusScopeNode,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: dev_height / 7.32,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment(-1, 1),
                                    child: Container(
                                      width: dev_width / 5.70,
                                      height: dev_height / 14.64,
                                      alignment: Alignment(0, 0.2),
                                      child: Icon(
                                        IconData(0xe081, fontFamily: 'MaterialIcons'),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment(1, 1),
                                    child: Container(
                                      width: dev_width / 1.7,
                                      height: dev_height / 14.64,
                                      alignment: Alignment(1, 1),
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w100),
                                        onTap: () {},
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: _handleSubmitted,
                                        controller: _controllerEmail,
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Email is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 0.5,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 0.5
                                              ),
                                            ),
                                            hintText: 'Email Address',
                                            hintStyle: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              color: Colors.black,
                                              fontSize: dev_height > dev_width
                                                  ? dev_height / 29.28
                                                  : dev_height / 16.48,
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: dev_height / 7.32,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment(-1, 1),
                                    child: Container(
                                      width: dev_width / 5.70,
                                      height: dev_height / 14.64,
                                      alignment: Alignment(0, 0.2),
                                      child: Icon(
                                        IconData(0xe47a, fontFamily: 'MaterialIcons'),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment(1, 1),
                                    child: Container(
                                      width: dev_width / 1.7,
                                      height: dev_height / 14.64,
                                      alignment: Alignment(1, 1),
                                      child: TextFormField(
                                        obscureText: true,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w100),
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Password is required';
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.previous,
                                        onFieldSubmitted: _handleSubmitted,
                                        controller: _controllerPassword,
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 0.5,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 0.5
                                              ),
                                            ),
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              color: Colors.black,
                                              fontSize: dev_height > dev_width
                                                  ? dev_height / 29.28
                                                  : dev_height / 16.48,
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: dev_height / 6,
                              alignment: Alignment(0, 1.4),
                              child: Container(
                                height: dev_height / 18,
                                child: OverflowBox(
                                  maxWidth: dev_width,
                                  maxHeight: dev_height / 18,
                                  child: FlatButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                                        /* email = _controllerEmail.text;
                                        password = _controllerPassword.text; */
                                        print(_controllerEmail.text.toString());
                                      }
                                    },
                                    child: Container(
                                      width: dev_width / 1.648,
                                      height: dev_height / 14,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          begin: Alignment(-1, -1),
                                          end: Alignment(1, 1),
                                          colors: [
                                            const Color.fromRGBO(134, 143, 150, 1),
                                            const Color.fromRGBO(89, 97, 100, 1),
                                          ], // whitish to gray
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'SIGN IN',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            color: Colors.black,
                                            fontSize: dev_height > dev_width
                                                ? dev_height / 24.4
                                                : dev_height / 13.74,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),),),),),);
            },
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      const SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      const SizedBox(height: 30)

    ],
  );
}
