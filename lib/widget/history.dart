import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key, required this.listHasil}) : super(key: key);

  final List listHasil;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: listHasil.map(
        (value) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              value.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
      ).toList(),
    );
  }
}
