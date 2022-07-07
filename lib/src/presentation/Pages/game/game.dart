import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_game/src/presentation/Pages/game/bloc/game_cubit.dart';
import 'package:quizz_game/src/presentation/Pages/game/bloc/game_state.dart';

import '../../../data/repositories/question_repository.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePagePageState createState() => _GamePagePageState();
}

class _GamePagePageState extends State<GamePage> {
  GameCubit? cubit;

  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: RepositoryProvider(
        create: (context) => QuestionRepository.getInstance(),
        child: BlocProvider(
          create: (context) {
            cubit = GameCubit(
                questionRepository:
                    RepositoryProvider.of<QuestionRepository>(context));
            return cubit!..fetchWord();
          },
          child: BlocConsumer<GameCubit, GameState>(
            listener: (context, state) {
              if (state is Loaded) {
                setState(() {
                  text = state.questions.first.question;
                });

              }
            },
            builder: (context, state) {
                return Column(
                  children: [
                    Text( text  ?? "Not found")
                  ],
                );
            },
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(height: 5),
      TextField(
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}
