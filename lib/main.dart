import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MatchesScreen/Match/match_class.dart';
import 'MatchesScreen/matches_screen.dart';

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
        textTheme: GoogleFonts.manropeTextTheme(),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          background: const Color.fromARGB(255, 230, 230, 230),
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.black,
          dividerHeight: 0.5,
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Map<String, List<EspansoMatch>>? matches;
  final String title;

  const MyHomePage({super.key, required this.title, this.matches});

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
      body: const MatchesScreen(),
      drawer: ListView(children: const [Text('testing the drawer')]),
    );
  }
}
