import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  MaterialApp build(BuildContext context) => const MaterialApp(
        title: "Code Trade IO",
        home: Text("data"),
      );
}
