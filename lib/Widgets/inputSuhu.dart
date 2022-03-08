// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

class InputSuhu extends StatelessWidget {
  const InputSuhu({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: etInput,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Celcius',
        hintText: 'Enter the temperature in celcius',
      ),
    );
  }
}