import 'package:flutter/material.dart';
import 'application/login.dart';
import 'application/signup.dart';

void main() {
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Visibility(
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe328, fontFamily: 'MaterialIcons')),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe36f, fontFamily: 'MaterialIcons')),
              label: 'Classement',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe491, fontFamily: 'MaterialIcons')),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          onTap: _onItemTapped,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Hello There!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(height: 30),
                  Text("Create an account or login to start playing.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15
                    ),
                  ),
                ],
              ),

              // Image login
              Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: const BoxDecoration(
                    image:DecorationImage(image: AssetImage('assets/Illustration.png'))
                ),
              ),

              // Login button
              MaterialButton(
                minWidth: double.infinity,
                height:60,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                color: Colors.indigoAccent[400],
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(40)
                ),
                child: const Text(
                  "Login",
                  style:
                  TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70
                  ),
                ),
              ),

              // Signup button
              MaterialButton(
                minWidth: double.infinity,
                height:60,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                },
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                ),
                child: const Text(
                  "Sign UP",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}