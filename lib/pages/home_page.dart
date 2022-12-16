import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: const Center(
                    child: Text(
                      "Regular Expression",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
