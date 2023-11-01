import 'package:card_memory_game/screens/play_screen.dart';
import 'package:card_memory_game/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/start_screen': (context) => const StartScreen(),
        '/play_screen': (context) => const PlayScreen(),
      },
      initialRoute: '/start_screen',
      //home: const PlayScreen(),
    );
  }
}
