import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SmartWatch Counter",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.compact,
      ),
      home: const WatchScreen(),
    );
  }
}

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (context, shape, child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return Counter(mode);
          },
        );
      },
    );
  }
}

class Counter extends StatefulWidget {
  final WearMode mode;

  Counter(this.mode);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  bool isWhiteBackground = true;

  void _toggleBackground() {
    setState(() {
      isWhiteBackground = !isWhiteBackground;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isWhiteBackground ? Colors.white : Colors.black,
      body: GestureDetector(
        onTap: _toggleBackground,
        child: Center(
          child: Text(
            'Hola Mundo Wear',
            style: TextStyle(
              fontSize: 20.0,
              // color: isWhiteBackground ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
