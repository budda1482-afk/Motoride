import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotoRide',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const Scaffold(body: Center(child: Text('MotoRide Loading...'))),
    );
  }
}
