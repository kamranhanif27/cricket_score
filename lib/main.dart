import 'package:cricket_score/screens/home_page.dart';
import 'package:cricket_score/view_models/leagues_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<LeagueViewModel>(
        create: (context) => LeagueViewModel(),
        child: HomePage()
      ),
    );
  }
}

