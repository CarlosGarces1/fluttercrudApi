import 'package:flutter/material.dart';
import 'package:pruebatecnica/screens/home.dart';

void main() async {
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(microseconds: 1));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => const HomeScreen(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.yellow,
        ),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
