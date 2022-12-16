import 'package:flutter/material.dart';

import './pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          color: Theme.of(context).primaryColor,
          centerTitle: true,
          scrolledUnderElevation: 7,
        ),
      ),
      title: 'RegX',
      home: const HomePage(),
    );
  }
}
