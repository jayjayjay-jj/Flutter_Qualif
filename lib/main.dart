import 'package:flutter/material.dart';
import 'package:qualif/pages/item_page.dart';
import 'package:qualif/pages/login_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType()!;
  }
}

class _MyAppState extends State<MyApp> {
  ThemeMode theme = ThemeMode.light;

  void changeTheme(String themeChoice) {
    setState(() {
      if(themeChoice == "Dark") {
        theme = ThemeMode.dark;
      } else if(themeChoice == "Light") {
        theme = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JI_Qualif",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: theme,
      home: const LoginPage(),
    );
  }
}