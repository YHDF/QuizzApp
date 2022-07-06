import 'package:flutter/material.dart';
import 'package:quizz_game/src/presentation/Widgets/bootstrap.dart';
import 'package:quizz_game/src/presentation/Pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  child: const Center(
                    child: Text(
                      "Quizz Game",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55, color: Colors.white),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hello There!",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    Text("Create an account or login to start playing.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      ),
                    ),
                  ],
                ),

                // Image login


                // Login button
                MaterialButton(
                  minWidth: double.infinity,
                  height:60,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Bootstrap()));
                  },
                  color: Colors.blueAccent[400],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: const Text(
                    "Login",
                    style:
                    TextStyle(
                        fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white
                    ),
                  ),
                ),

                // Signup button
                MaterialButton(
                  minWidth: double.infinity,
                  height:60,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}