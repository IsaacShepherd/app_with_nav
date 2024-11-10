import "package:flutter/material.dart";

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Second Page'),
          centerTitle: true,
        ),
        body: const Center(
            child: Text(
          'Second Page',
          style: TextStyle(fontSize: 30),
        )));
  }
}
