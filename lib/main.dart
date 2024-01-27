import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_project/HomeScreen.dart';
import 'package:studio_project/Provider.dart';
import 'package:studio_project/SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => NumberListProvider(),)
    ],
        child : MaterialApp(
        title: "Sandesh",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomeScreen()
    ),);
  }
}
