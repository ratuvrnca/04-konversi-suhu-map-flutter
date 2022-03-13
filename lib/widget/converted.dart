import 'package:flutter/material.dart';

class Converted extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final konvertHandler;

  const Converted({Key? key, required this.konvertHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: konvertHandler,
        color: Colors.pink,
        textColor: Colors.white,
        child: const Text("Konversi"),
      ),
    );
  }
}
