import 'package:flutter/material.dart';
import 'package:quizz_game/src/presentation/Pages/home.dart';
import 'package:quizz_game/src/presentation/Pages/initial_page.dart';
import 'package:quizz_game/src/presentation/Pages/signup.dart';
import 'package:quizz_game/src/presentation/Pages/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizz_game/src/presentation/Widgets/bootstrap.dart';
import 'package:quizz_game/src/data/repositories/auth_repository.dart';
import 'package:quizz_game/src/presentation/Widgets/bootstrap.dart';
import '../firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz Nutzz',
      theme: ThemeData(
        fontFamily: 'Fredoka',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quizz Dezz Nutzz Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final AuthRepository? authRepository = AuthRepository.getInstance();

  @override
  void initState(){
    super.initState();
  }


  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(authRepository!.isSignedIn()) {
      return Bootstrap();
    } else {
      return InitialPage();
    }
  }
}