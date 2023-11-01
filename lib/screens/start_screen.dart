import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 48).animate(_controller)
      ..addListener(() {
        if (_animation.value >= 48) {
          _controller.stop();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/play_screen');
            },
            child: Text(
              'Let Play',
              style: TextStyle(
                fontSize: _animation.value,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
