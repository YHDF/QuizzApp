import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/data/repositories/user_repository.dart';
import 'package:quizz_game/src/presentation/Pages/signin/signin_cubit.dart';
import 'package:quizz_game/src/presentation/Pages/signin/signin_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  SignInCubit? cubit;

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
      body: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepository?>(
            create: (context) => UserRepository.getInstance(),
          ),
          RepositoryProvider<AuthRepository?>(
            create: (context) => AuthRepository.getInstance(),
          ),
        ],
        child: BlocProvider(
          create: (context) {
            cubit = SignInCubit(
                userRepository: RepositoryProvider.of<UserRepository>(context),
                authRepository: RepositoryProvider.of<AuthRepository>(context));
            return cubit!;
          },
          child: BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state is Error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Erreur')))
                    .closed
                    .then((reason) {});
              } else if (state is Loading) {
                setState(() {
                  //displayLoader = true;
                });
              }
            },
            builder: (context, state) {
              if (state is Success) {
                return Container();
              }
              return Container();
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
