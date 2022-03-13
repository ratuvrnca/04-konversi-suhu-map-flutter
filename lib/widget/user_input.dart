import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class User_Input extends StatelessWidget {
  const User_Input({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Masukkan suhu dalam celcius',
      ),
    );
  }
}
