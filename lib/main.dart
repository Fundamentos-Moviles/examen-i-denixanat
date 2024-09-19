import 'package:flutter/material.dart';
import 'package:examen1_dxgh/home.dart';
import 'package:examen1_dxgh/login.dart';

void main() {
  runApp(const MyApp());
}

///Clase solo para crear widgets sin cambios estado
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}

