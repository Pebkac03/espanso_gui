import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

import 'Match/match_class.dart';
import 'Match/match_widget.dart';
import 'MatchScreen/match_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Map<String, List<EspansoMatch>>? matches;
  final String title;

  MyHomePage({super.key, required this.title, this.matches});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              'Espanso GUI, the program does currently not modify the Espanso config files')),
      body: MatchesScreen(),
      drawer: ListView(children: [Text('testing the drawer')]),
    );
  }
}
