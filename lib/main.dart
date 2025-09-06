import 'package:ecommerce/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({super.key});
@override
  Widget build(BuildContext context) {
  return  MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'weather app',
    theme: ThemeData(
      primarySwatch: Colors.blue,

    ),
    home: HomeScreen(),
  );
}
}
