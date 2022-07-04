import 'package:flutter/material.dart';
import 'package:quizz_dezz_nutzz/src/presentation/BottomBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Widget build(BuildContext context) {
    var dev_width = MediaQuery.of(context).size.width;
    var dev_height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:   Container(
        width: dev_width,
        height: dev_height,
        color: Colors.red,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child:  BottomBar(),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
