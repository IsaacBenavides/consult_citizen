import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String text;

  const SecondPage({Key? key, this.text = ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text),
      ),
    );
  }
}
