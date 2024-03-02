import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

import 'Match/match_class.dart';
import 'Match/match_widget.dart';

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
  List<Map> espansoConfig = [
    {'type': 'test'},
    {'type': 'test2'}
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, List<EspansoMatch?>?>? matches =
        widget.matches ?? EspansoMatches.fromYaml().matches;
    print(matches);

    Widget buildColumn() {
      List<ExpansionTile>? widgets = [];
      matches?.forEach((String key, List<EspansoMatch?>? match) {
        final List<EspansoMatch>? newMatch =
            match?.toList().cast<EspansoMatch>();
        widgets.add(ExpansionTile(
          title: Text(/*key*/ '\u23f8',
              style: Theme.of(context).textTheme.headlineSmall),
          children: newMatch?.map(
                (e) {
                  return MatchWidget(match: e);
                },
              ).toList() ??
              [],
        ));
      });
      return ListView(
        children: widgets,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: buildColumn(),
    );
  }
}
