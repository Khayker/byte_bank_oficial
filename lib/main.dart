import 'package:byte_bank_oficial/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBank());
}

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        primary: Colors.green[900],
        secondary: Colors.green,
      )),
      home: const Dashboard(),
    );
  }
}
