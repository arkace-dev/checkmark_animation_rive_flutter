import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _animate = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: 500,
                width: 500,
                child: FlareActor(
                  'assets/Checkmark Animation.flr',
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                  animation: _animate ? "appear" : "idle",
                  isPaused: _animate,
                ),
              ),
              Center(
                child: GestureDetector(
                    child: AnimatedContainer(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                          color: _animate ? Colors.grey : Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      duration: Duration(milliseconds: 500),
                      child: Text(
                        _animate ? 'Animate' : 'Animating',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _animate = !_animate;
                      });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
