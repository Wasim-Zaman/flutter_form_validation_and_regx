import 'package:flutter/material.dart';

import '../widgets/my_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reg-X'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: MyForm(),
      ),
    );
  }
}
