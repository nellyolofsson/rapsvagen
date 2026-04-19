import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const RapsvagenApp());

class RapsvagenApp extends StatelessWidget {
  const RapsvagenApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Rapsvägen 2026',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: kAmber400),
      fontFamily: 'Roboto',
      useMaterial3: true,
    ),
    home: const HomePage(),
  );
}
